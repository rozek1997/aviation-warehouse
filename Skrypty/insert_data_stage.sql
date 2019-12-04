create procedure loadData as
begin


bulk insert AIRLINES
from 'Y:\HD\Projekt_ostateczny\Dane\airlines.dat'
WITH ( 
DATAFILETYPE = 'char',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '0x0A',
FIRSTROW = 2,
KEEPNULLS
);

bulk insert AIRPORT
from 'Y:\HD\Projekt_ostateczny\Dane\L_AIRPORT_ID.csv'
WITH ( 
DATAFILETYPE = 'char',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '0x0A',
FIRSTROW = 2,
KEEPNULLS
);

bulk insert AIRPORTS
from 'Y:\HD\Projekt_ostateczny\Dane\airports.dat'
WITH ( 
DATAFILETYPE = 'char',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '0x0A',
FIRSTROW = 2,
KEEPNULLS
);

bulk insert CITYMARKETID
from 'Y:\HD\Projekt_ostateczny\Dane\L_CITY_MARKET_ID.csv'
WITH ( 
DATAFILETYPE = 'char',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '0x0A',
FIRSTROW = 2,
KEEPNULLS
);


bulk insert DISTANCEGROUP250
from 'Y:\HD\Projekt_ostateczny\Dane\L_DISTANCE_GROUP_250.csv'
WITH ( 
DATAFILETYPE = 'char',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '0x0A',
FIRSTROW = 2,
KEEPNULLS
);

bulk insert FACTFLIGHT
from 'Y:\HD\Projekt_ostateczny\Dane\574784350_T_ONTIME_REPORTING.csv'
WITH ( 
DATAFILETYPE = 'char',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '0x0A',
FIRSTROW = 2,
KEEPNULLS
);


bulk insert ONTIMEDELAYGROUPS
from 'Y:\HD\Projekt_ostateczny\Dane\L_ONTIME_DELAY_GROUPS.csv'
WITH ( 
DATAFILETYPE = 'char',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '0x0A',
FIRSTROW = 2,
KEEPNULLS
);


bulk insert UNIQUECARRIERS
from 'Y:\HD\Projekt_ostateczny\Dane\L_UNIQUE_CARRIERS.csv'
WITH ( 
DATAFILETYPE = 'char',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '0x0A',
FIRSTROW = 2,
KEEPNULLS
);

bulk insert WORLDAREACODES
from 'Y:\HD\Projekt_ostateczny\Dane\L_WORLD_AREA_CODES.csv'
WITH ( 
DATAFILETYPE = 'char',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '0x0A',
FIRSTROW = 2,
KEEPNULLS
);



end
