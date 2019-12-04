create procedure insert_dimData as
begin
DECLARE @StartDate DATE = '20190101', @NumberOfYears INT = 1;

-- prevent set or regional settings from interfering with 
-- interpretation of dates / literals

SET DATEFIRST 1;
SET DATEFORMAT dmy;
SET LANGUAGE us_english;

DECLARE @CutoffDate DATE = DATEADD(YEAR, @NumberOfYears, @StartDate);

-- this is just a holding table for intermediate calculations:

CREATE TABLE #dim
(
  [date]       DATE PRIMARY KEY,
  [year]       AS DATEPART(YEAR,     [date]),
  [month]      AS DATEPART(MONTH,    [date]),
  [FirstOfMonth] AS CONVERT(DATE, DATEADD(MONTH, DATEDIFF(MONTH, 0, [date]), 0)),
  [monthName]  AS DATENAME(MONTH,    [date]),
  [dayOfMonth]  AS DATEPART(DAY,  [date]),
  [dayOfWeek]  AS DATEPART(WEEKDAY,  [date]),
  [dayOfWeekName]  AS DATENAME(WEEKDAY,  [date]),
  [quarter]    AS DATEPART(QUARTER,  [date]),
);

-- use the catalog views to generate as many rows as we need

INSERT #dim([date]) 
SELECT d
FROM
(
  SELECT d = DATEADD(DAY, rn - 1, @StartDate)
  FROM 
  (
    SELECT TOP (DATEDIFF(DAY, @StartDate, @CutoffDate)) 
      rn = ROW_NUMBER() OVER (ORDER BY s1.[object_id])
    FROM sys.all_objects AS s1
    CROSS JOIN sys.all_objects AS s2
    -- on my system this would support > 5 million days
    ORDER BY s1.[object_id]
  ) AS x
) AS y;

INSERT dbo.DimDate WITH (TABLOCKX)
SELECT
  [DateID]        = ROW_NUMBER() OVER(ORDER BY [date] ASC),
  [Date]		= [date],
  [Year]        = CONVERT(INT, [year]),
  [Month]       = CONVERT(INT, [month]),
  [MonthName]   = CONVERT(VARCHAR(255), [MonthName]),
  [DayOfMonth]  = CONVERT(INT, [dayOfMonth]),
  [DayOfWeek]  = CONVERT(INT, [dayOfWeek]),
  [DayOfWeekName]  = CONVERT(VARCHAR(255), [dayOfWeekName]),
  [Quarter]     = CONVERT(INT, [quarter]),
  [QuarterName]   = CONVERT(VARCHAR(255), CASE [quarter] WHEN 1 THEN 'First' 
                  WHEN 2 THEN 'Second' WHEN 3 THEN 'Third' WHEN 4 THEN 'Fourth' END),
  [FirstDayOfMonth]     = FirstOfMonth,
  [LastDayOfMonth]      = MAX([date]) OVER (PARTITION BY [year], [month]),
  [FirstDayOfQuarter]   = MIN([date]) OVER (PARTITION BY [year], [quarter]),
  [LastDayOfQuarter]    = MAX([date]) OVER (PARTITION BY [year], [quarter])

FROM #dim
OPTION (MAXDOP 1);

end