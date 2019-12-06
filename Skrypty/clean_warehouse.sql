
create procedure clean_warehouse as
if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FactFlight') and o.name = 'FK_FACTFLIG_ACTUALARR_DIMTIME')
alter table FactFlight
   drop constraint FK_FACTFLIG_ACTUALARR_DIMTIME
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FactFlight') and o.name = 'FK_FACTFLIG_ACTUALDEP_DIMTIME')
alter table FactFlight
   drop constraint FK_FACTFLIG_ACTUALDEP_DIMTIME
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FactFlight') and o.name = 'FK_FACTFLIG_AIRLINE_DIMAIRLI')
alter table FactFlight
   drop constraint FK_FACTFLIG_AIRLINE_DIMAIRLI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FactFlight') and o.name = 'FK_FACTFLIG_ARRIVALDE_DIMDELAY')
alter table FactFlight
   drop constraint FK_FACTFLIG_ARRIVALDE_DIMDELAY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FactFlight') and o.name = 'FK_FACTFLIG_ARRIVALTI_DIMTIME')
alter table FactFlight
   drop constraint FK_FACTFLIG_ARRIVALTI_DIMTIME
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FactFlight') and o.name = 'FK_FACTFLIG_DEPARTURE_DIMDELAY')
alter table FactFlight
   drop constraint FK_FACTFLIG_DEPARTURE_DIMDELAY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FactFlight') and o.name = 'FK_FACTFLIG_DEPARTURE_DIMTIME')
alter table FactFlight
   drop constraint FK_FACTFLIG_DEPARTURE_DIMTIME
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FactFlight') and o.name = 'FK_FACTFLIG_DESTINATI_DIMAIRPO')
alter table FactFlight
   drop constraint FK_FACTFLIG_DESTINATI_DIMAIRPO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FactFlight') and o.name = 'FK_FACTFLIG_DISTANCEG_DIMDISTA')
alter table FactFlight
   drop constraint FK_FACTFLIG_DISTANCEG_DIMDISTA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FactFlight') and o.name = 'FK_FACTFLIG_FLIGHTDAT_DIMDATE')
alter table FactFlight
   drop constraint FK_FACTFLIG_FLIGHTDAT_DIMDATE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FactFlight') and o.name = 'FK_FACTFLIG_ORIGINAIR_DIMAIRPO')
alter table FactFlight
   drop constraint FK_FACTFLIG_ORIGINAIR_DIMAIRPO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FactFlight') and o.name = 'FK_FACTFLIG_WHEELSOFF_DIMTIME')
alter table FactFlight
   drop constraint FK_FACTFLIG_WHEELSOFF_DIMTIME
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FactFlight') and o.name = 'FK_FACTFLIG_WHEELSON_DIMTIME')
alter table FactFlight
   drop constraint FK_FACTFLIG_WHEELSON_DIMTIME
go


exec sp_MSforeachtable'TRUNCATE TABLE?';

alter table FactFlight
   add constraint FK_FACTFLIG_ACTUALARR_DIMTIME foreign key (ActualArrivalTimeID)
      references DimTime (TimeID);

alter table FactFlight
   add constraint FK_FACTFLIG_ACTUALDEP_DIMTIME foreign key (ActualDepartureTimeID)
      references DimTime (TimeID);

alter table FactFlight
   add constraint FK_FACTFLIG_AIRLINE_DIMAIRLI foreign key (AirlineID)
      references DimAirline (AirlineID);

alter table FactFlight
   add constraint FK_FACTFLIG_ARRIVALDE_DIMDELAY foreign key (ArrivalDelayGroupsID)
      references DimDelayGroups (DelayGroupsID);

alter table FactFlight
   add constraint FK_FACTFLIG_ARRIVALTI_DIMTIME foreign key (ArrivalTimeID)
      references DimTime (TimeID);

alter table FactFlight
   add constraint FK_FACTFLIG_DEPARTURE_DIMDELAY foreign key (DepartureDelayGroupsID)
      references DimDelayGroups (DelayGroupsID);

alter table FactFlight
   add constraint FK_FACTFLIG_DEPARTURE_DIMTIME foreign key (WheelsOnID)
      references DimTime (TimeID);

alter table FactFlight
   add constraint FK_FACTFLIG_DESTINATI_DIMAIRPO foreign key (OriginAirportID)
      references DimAirport (AirportID);

alter table FactFlight
   add constraint FK_FACTFLIG_DISTANCEG_DIMDISTA foreign key (DistanceRangeID)
      references DimDistanceRange (DistanceRangeID);

alter table FactFlight
   add constraint FK_FACTFLIG_FLIGHTDAT_DIMDATE foreign key (FlightDateID)
      references DimDate (DateID);

alter table FactFlight
   add constraint FK_FACTFLIG_ORIGINAIR_DIMAIRPO foreign key (DestinationAirportID)
      references DimAirport (AirportID);

alter table FactFlight
   add constraint FK_FACTFLIG_WHEELSOFF_DIMTIME foreign key (DepartureTimeID)
      references DimTime (TimeID);

alter table FactFlight
   add constraint FK_FACTFLIG_WHEELSON_DIMTIME foreign key (WheelsOffID)
      references DimTime (TimeID);