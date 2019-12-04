create procedure insert_dimDistance as
begin
insert into hd.dbo.DimDistanceRange
select distinct 
	ROW_NUMBER() OVER (ORDER BY CAST(Substring(Code,2,LEN(Code)-2) AS INT)), 
	CAST(Substring(Code,2,LEN(Code)-2) AS INT),
	Substring(Description,2,LEN(Description)-3) 
FROM stage.dbo.DISTANCEGROUP250
end;

create procedure insert_dimDelayGroup as
begin
insert into hd.dbo.DimDelayGroups
select distinct 
	ROW_NUMBER() OVER (ORDER BY CAST(Substring(Code,2,LEN(Code)-2) AS INT)), 
	CAST(Substring(Code,2,LEN(Code)-2) AS INT),
	Substring(Description,2,LEN(Description)-3) 
FROM stage.dbo.ONTIMEDELAYGROUPS;
end;

create procedure insert_dimAirlines as
begin 
insert into hd.dbo.DimAirline
	select distinct 
		AIRLINEID,
		NAME, 
		ALIAS, 
		IATA, 
		ICAO, 
		COUNTRY, 
		ACTIVE
FROM    stage.dbo.AIRLINES

		
end

create procedure insert_dimAirport as
begin
insert into hd.dbo.DimAirport
select distinct AIRPORTID,
	NAME,
	CITY,
	COUNTRY,
	CASE WHEN IATA = '\N' THEN NULL ELSE IATA END, 
	CASE WHEN ICAO = '\N' THEN NULL ELSE ICAO END, 
	LATITUDE, 
	LONGITUDE, 
	ALTITUDE, 
	CASE WHEN TIMEZONE = '\N' THEN NULL ELSE TIMEZONE END,
	TYPE, 
	CASE WHEN DST = '\N' THEN NULL ELSE Substring(DST, 2, 1) END
from stage.dbo.AIRPORTS

	 
end;

create procedure insert_allDimension as
begin
exec insert_dimDistance;
exec insert_dimDelayGroup;
exec insert_dimAirlines;
exec insert_dimTime;
exec insert_dimData;
exec insert_dimAirport;

end


create sequence FlightIdSeq
start with 1
increment by 1

Create procedure Insert_FactFlightActivity as
insert into hd.dbo.FactFlight 
select next value for hd.dbo.FlightIdSeq, 
				dd.DateID,
				wheelsOn.TimeID, 
				wheelsOff.TimeID,
				scheduledArrivalTime.TimeID,
				scheduledDepartureTime.TimeID,
				actualDepartureTime.TimeID,
				actualArrivalTime.TimeID,
				dOriginAirport.AirportID,
				dDestinationAirpot.AirportID,
				dAirline.AirlineID,
				ddR.DistanceRangeID,
				ddGArrival.DelayGroupsID,
				ddGDestination.DelayGroupsID,
				CAST(substring(ff.DEPDELAYMINUTES, 0, len(ff.DEPDELAYMINUTES) - 3) AS INT),
				CAST(substring(ff.ARRDELAYMINUTES, 0, len(ff.ARRDELAYMINUTES) - 3) AS INT),
				CAST(substring(ff._TAXIIN, 0, len(ff._TAXIIN) - 3) AS INT),
				CAST(substring(ff.TAXIOUT, 0, len(ff.TAXIOUT) - 3) AS INT),
				CAST(substring(ff.CANCELLED, 0, len(ff.CANCELLED) - 3) AS bit),
				CAST(substring(ff.DIVERTED, 0, len(ff.DIVERTED) - 3) AS bit),
				CAST(substring(ff.CRSELAPSEDTIME, 0, len(ff.CRSELAPSEDTIME) - 3) AS int),
				CAST(substring(ff.ACTUALELAPSEDTIME, 0, len(ff.ACTUALELAPSEDTIME) - 3) AS int),
				CAST(substring(ff.AIRTIME, 0, len(ff.AIRTIME) - 3) AS int),
				CAST(substring(ff.DISTANCE, 0, len(ff.DISTANCE) - 3) AS int),
				CAST(substring(ff.CARRIERDELAY, 0, len(ff.CARRIERDELAY) - 3) AS int),
				CAST(substring(ff.WEATHERDELAY, 0, len(ff.WEATHERDELAY) - 3) AS int),
				CAST(substring(ff.NASDELAY, 0, len(ff.NASDELAY) - 3) AS int),
				CAST(substring(ff.SECURITYDELAY, 0, len(ff.SECURITYDELAY) - 3) AS int),
				CAST(substring(ff.LATEAIRCRAFTDELAY, 0, len(ff.LATEAIRCRAFTDELAY) - 3) AS int),
				CAST(substring(ff.DEPDEL15, 0, len(ff.DEPDEL15) - 3) AS bit),
				CAST(substring(ff._ARRDEL15, 0, len(ff._ARRDEL15) - 3) AS bit)
from stage.dbo.FACTFLIGHT ff
join hd.dbo.DimAirline dAirline on dAirline.AirlineIATA = ff.IATA_CODE_REPORTING_AIRLINE
join hd.dbo.DimAirport dOriginAirport on dOriginAirport.AirportIATA = ff.ORIGIN
join hd.dbo.DimAirport dDestinationAirpot on dDestinationAirpot.AirportIATA = ff.DEST
join hd.dbo.DimDate dd on CAST(dd.Date as date) = CAST(ff.FLIGHTDATE as date)
join hd.dbo.DimDelayGroups ddGDestination on ddGDestination.DelayGroupsCode = ff.DEPARTUREDELAYGROUPS
join hd.dbo.DimDelayGroups ddGArrival on ddGArrival.DelayGroupsCode = ff.ARRIVALDELAYGROUPS
join hd.dbo.DimDistanceRange  ddR on ddR.DistanceRangeCode = ff.DISTANCEGROUP
join hd.dbo.DimTime wheelsOn on wheelsOn.TimeID = cast(substring(ff.WHEELSON, 2, len(ff.WHEELSON)-2) AS INT)
join hd.dbo.DimTime wheelsOff on wheelsOff.TimeID = cast(substring(ff.WHEELSOFF, 2, len(ff.WHEELSOFF)-2) AS INT)
join hd.dbo.DimTime scheduledDepartureTime on scheduledDepartureTime.TimeID = cast(substring(ff.CRSDEPTIME, 2, len(ff.CRSDEPTIME)-2) AS INT)
join hd.dbo.DimTime scheduledArrivalTime on scheduledArrivalTime.TimeID = cast(substring(ff.CRSARRTIME, 2, len(ff.CRSARRTIME)-2) AS INT)
join hd.dbo.DimTime actualArrivalTime on actualArrivalTime.TimeID = cast(substring(ff.DEPTIME, 2, len(ff.DEPTIME)-2) AS INT)
join hd.dbo.DimTime actualDepartureTime on actualDepartureTime.TimeID = cast(substring(ff._ARRTIME, 2, len(ff._ARRTIME)-2) AS INT)

