exec loadData

select *
from DimDate

exec Insert_FactFlightActivity
 exec cleanDatabase

select *
from stage.dbo.FACTFLIGHT

select dOriginAirport.AirportID
from stage.dbo.FACTFLIGHT ff
join hd.dbo.DimAirport dOriginAirport on dOriginAirport.AirportIATA = ff.ORIGIN

select *
from stage.dbo.FACTFLIGHT ff
join hd.dbo.DimTime wheelsOn on wheelsOn.TimeID = cast(substring(ff.WHEELSON, 2, len(ff.WHEELSON)-2) AS INT)

exec Insert_FactFlightActivity

select *
from hd.dbo.FactFlight
where CarrierDelay = 29 and DistanceRangeID = 1
order by FlightDateID

select *
from stage.dbo.FactFlight
where CARRIERDELAY ='29.00' and DISTANCEGROUP = 1
order by FLIGHTDATE

select *
from stage.dbo.FACTFLIGHT
order by WHEELSON

select *
from hd.dbo.DimAirline

select YEAR(CAST(Date as date))
from hd.dbo.DimDate dd

select dd.Date
from stage.dbo.FACTFLIGHT ff
join hd.dbo.DimDate dd on CAST(dd.Date as date) = CAST(ff.FLIGHTDATE as date)


select CAST(substring(ff.NASDELAY, 0, len(ff.NASDELAY) - 3) AS int)
from stage.dbo.FACTFLIGHT ff

CAST(substring(ff.NASDELAY, 0, len(ff.NASDELAY) - 3) AS int)
select CAST(substring(ff.DEPDELAYMINUTES, 0, len(ff.DEPDELAYMINUTES) - 3) AS INT)
from stage.dbo.FACTFLIGHT ff

select CAST(substring(ff.DIVERTED, 0, len(ff.DIVERTED) - 3) AS bit)
from FACTFLIGHT ff