/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2017                    */
/* Created on:     01.12.2019 20:02:30                          */
/*==============================================================*/


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

if exists (select 1
            from  sysobjects
           where  id = object_id('DimAirline')
            and   type = 'U')
   drop table DimAirline
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DimAirport')
            and   type = 'U')
   drop table DimAirport
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DimDate')
            and   type = 'U')
   drop table DimDate
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DimDelayGroups')
            and   type = 'U')
   drop table DimDelayGroups
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DimDistanceRange')
            and   type = 'U')
   drop table DimDistanceRange
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DimTime')
            and   type = 'U')
   drop table DimTime
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FactFlight')
            and   name  = 'DestinationAirportID_FK'
            and   indid > 0
            and   indid < 255)
   drop index FactFlight.DestinationAirportID_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FactFlight')
            and   name  = 'OriginAirportID_FK'
            and   indid > 0
            and   indid < 255)
   drop index FactFlight.OriginAirportID_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FactFlight')
            and   name  = 'DepartureDelayGroups_FK'
            and   indid > 0
            and   indid < 255)
   drop index FactFlight.DepartureDelayGroups_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FactFlight')
            and   name  = 'ArrivalDelayGroups_FK'
            and   indid > 0
            and   indid < 255)
   drop index FactFlight.ArrivalDelayGroups_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FactFlight')
            and   name  = 'DistanceGroup_FK'
            and   indid > 0
            and   indid < 255)
   drop index FactFlight.DistanceGroup_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FactFlight')
            and   name  = 'Airline_FK'
            and   indid > 0
            and   indid < 255)
   drop index FactFlight.Airline_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FactFlight')
            and   name  = 'FlightDate_FK'
            and   indid > 0
            and   indid < 255)
   drop index FactFlight.FlightDate_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FactFlight')
            and   name  = 'WheelsOn_FK'
            and   indid > 0
            and   indid < 255)
   drop index FactFlight.WheelsOn_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FactFlight')
            and   name  = 'WheelsOff_FK'
            and   indid > 0
            and   indid < 255)
   drop index FactFlight.WheelsOff_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FactFlight')
            and   name  = 'ActualArrivalTime_FK'
            and   indid > 0
            and   indid < 255)
   drop index FactFlight.ActualArrivalTime_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FactFlight')
            and   name  = 'ScheduledArrivalTime_FK'
            and   indid > 0
            and   indid < 255)
   drop index FactFlight.ScheduledArrivalTime_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FactFlight')
            and   name  = 'ActualDepartureTime_FK'
            and   indid > 0
            and   indid < 255)
   drop index FactFlight.ActualDepartureTime_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FactFlight')
            and   name  = 'ScheduledDepartureTime_FK'
            and   indid > 0
            and   indid < 255)
   drop index FactFlight.ScheduledDepartureTime_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FactFlight')
            and   type = 'U')
   drop table FactFlight
go

/*==============================================================*/
/* Table: DimAirline                                            */
/*==============================================================*/
create table DimAirline (
   AirlineID            int                  not null,
   AirlineName          varchar(255)         null,
   AirlineAlias         varchar(255)         null,
   AirlineIATA          varchar(255)         null,
   AirlineICAO          varchar(255)         null,
   AirlineCountry       varchar(255)         null,
   AirlineActive        varchar(255)         null,
   constraint PK_DIMAIRLINE primary key (AirlineID)
)
go

/*==============================================================*/
/* Table: DimAirport                                            */
/*==============================================================*/
create table DimAirport (
   AirportID            int                  not null,
   AirportName          varchar(255)         null,
   AirportCity          varchar(255)         null,
   AirportCountry       varchar(255)         null,
   AirportIATA          varchar(255)         null,
   AirportICAO          varchar(255)         null,
   AirportLatitude      varchar(255)         null,
   AirportLongtitude    varchar(255)         null,
   AirportAltitude      varchar(255)         null,
   AirportTimezone      varchar(255)         null,
   AirportType          varchar(255)         null,
   AirportStateName     varchar(255)         null,
   constraint PK_DIMAIRPORT primary key (AirportID)
)
go

/*==============================================================*/
/* Table: DimDate                                               */
/*==============================================================*/
create table DimDate (
   DateID               int                  not null,
   Date                 datetime             null,
   Year                 int                  null,
   Month                int                  null,
   MonthName            varchar(255)         null,
   DayOfMonth           int                  null,
   DayOfWeek            int                  null,
   DayOfWeekName        varchar(255)         null,
   Quarter              int                  null,
   QuarterName          varchar(255)         null,
   FirstDayOfMonth      datetime             null,
   LastDayOfMonth       datetime             null,
   FirstDayOfQuarter    datetime             null,
   LastDayOfQuarter     datetime             null,
   constraint PK_DIMDATE primary key (DateID)
)
go

/*==============================================================*/
/* Table: DimDelayGroups                                        */
/*==============================================================*/
create table DimDelayGroups (
   DelayGroupsID        int                  not null,
   DelayGroupsCode      int                  null,
   DelayGroupsDescription varchar(255)         null,
   constraint PK_DIMDELAYGROUPS primary key (DelayGroupsID)
)
go

/*==============================================================*/
/* Table: DimDistanceRange                                      */
/*==============================================================*/
create table DimDistanceRange (
   DistanceRangeID      int                  not null,
   DistanceRangeCode    int                  null,
   DistanceRangeDescription varchar(255)         null,
   constraint PK_DIMDISTANCERANGE primary key (DistanceRangeID)
)
go

/*==============================================================*/
/* Table: DimTime                                               */
/*==============================================================*/
create table DimTime (
   TimeID               int                  not null,
   Hour                 int                  null,
   Minute               int                  null,
   constraint PK_DIMTIME primary key (TimeID)
)
go

/*==============================================================*/
/* Table: FactFlight                                            */
/*==============================================================*/
create table FactFlight (
   FlightID             int                  not null,
   FlightDateID         int                  not null,
   WheelsOnID           int                  not null,
   WheelsOffID          int                  not null,
   ArrivalTimeID        int                  not null,
   DepartureTimeID      int                  not null,
   ActualDepartureTimeID int                  not null,
   ActualArrivalTimeID  int                  not null,
   OriginAirportID      int                  null,
   DestinationAirportID int                  null,
   AirlineID            int                  null,
   DistanceRangeID      int                  null,
   ArrivalDelayGroupsID int                  null,
   DepartureDelayGroupsID int                  null,
   DepartureDelay       int                  null,
   ArrivalDelay         int                  null,
   TaxiOut              int                  null,
   TaxiIn               int                  null,
   Cancelled            bit                  null,
   Diverted             bit                  null,
   ScheduledElapsedTime int                  null,
   ActualElapsedTime    int                  null,
   AirTime              int                  null,
   Distance             int                  null,
   CarrierDelay         int                  null,
   WeatherDelay         int                  null,
   NasDelay             int                  null,
   SecurityDelay        int                  null,
   LateAircraftDelay    int                  null,
   DepartuteDelay15OrMore bit                  null,
   ArrivalDelay15OrMore bit                  null,
   constraint PK_FACTFLIGHT primary key (FlightID)
)
go

/*==============================================================*/
/* Index: ScheduledDepartureTime_FK                             */
/*==============================================================*/




create nonclustered index ScheduledDepartureTime_FK on FactFlight (WheelsOnID ASC)
go

/*==============================================================*/
/* Index: ActualDepartureTime_FK                                */
/*==============================================================*/




create nonclustered index ActualDepartureTime_FK on FactFlight (ActualDepartureTimeID ASC)
go

/*==============================================================*/
/* Index: ScheduledArrivalTime_FK                               */
/*==============================================================*/




create nonclustered index ScheduledArrivalTime_FK on FactFlight (ArrivalTimeID ASC)
go

/*==============================================================*/
/* Index: ActualArrivalTime_FK                                  */
/*==============================================================*/




create nonclustered index ActualArrivalTime_FK on FactFlight (ActualArrivalTimeID ASC)
go

/*==============================================================*/
/* Index: WheelsOff_FK                                          */
/*==============================================================*/




create nonclustered index WheelsOff_FK on FactFlight (DepartureTimeID ASC)
go

/*==============================================================*/
/* Index: WheelsOn_FK                                           */
/*==============================================================*/




create nonclustered index WheelsOn_FK on FactFlight (WheelsOffID ASC)
go

/*==============================================================*/
/* Index: FlightDate_FK                                         */
/*==============================================================*/




create nonclustered index FlightDate_FK on FactFlight (FlightDateID ASC)
go

/*==============================================================*/
/* Index: Airline_FK                                            */
/*==============================================================*/




create nonclustered index Airline_FK on FactFlight (AirlineID ASC)
go

/*==============================================================*/
/* Index: DistanceGroup_FK                                      */
/*==============================================================*/




create nonclustered index DistanceGroup_FK on FactFlight (DistanceRangeID ASC)
go

/*==============================================================*/
/* Index: ArrivalDelayGroups_FK                                 */
/*==============================================================*/




create nonclustered index ArrivalDelayGroups_FK on FactFlight (ArrivalDelayGroupsID ASC)
go

/*==============================================================*/
/* Index: DepartureDelayGroups_FK                               */
/*==============================================================*/




create nonclustered index DepartureDelayGroups_FK on FactFlight (DepartureDelayGroupsID ASC)
go

/*==============================================================*/
/* Index: OriginAirportID_FK                                    */
/*==============================================================*/




create nonclustered index OriginAirportID_FK on FactFlight (DestinationAirportID ASC)
go

/*==============================================================*/
/* Index: DestinationAirportID_FK                               */
/*==============================================================*/




create nonclustered index DestinationAirportID_FK on FactFlight (OriginAirportID ASC)
go

alter table FactFlight
   add constraint FK_FACTFLIG_ACTUALARR_DIMTIME foreign key (ActualArrivalTimeID)
      references DimTime (TimeID)
go

alter table FactFlight
   add constraint FK_FACTFLIG_ACTUALDEP_DIMTIME foreign key (ActualDepartureTimeID)
      references DimTime (TimeID)
go

alter table FactFlight
   add constraint FK_FACTFLIG_AIRLINE_DIMAIRLI foreign key (AirlineID)
      references DimAirline (AirlineID)
go

alter table FactFlight
   add constraint FK_FACTFLIG_ARRIVALDE_DIMDELAY foreign key (ArrivalDelayGroupsID)
      references DimDelayGroups (DelayGroupsID)
go

alter table FactFlight
   add constraint FK_FACTFLIG_ARRIVALTI_DIMTIME foreign key (ArrivalTimeID)
      references DimTime (TimeID)
go

alter table FactFlight
   add constraint FK_FACTFLIG_DEPARTURE_DIMDELAY foreign key (DepartureDelayGroupsID)
      references DimDelayGroups (DelayGroupsID)
go

alter table FactFlight
   add constraint FK_FACTFLIG_DEPARTURE_DIMTIME foreign key (WheelsOnID)
      references DimTime (TimeID)
go

alter table FactFlight
   add constraint FK_FACTFLIG_DESTINATI_DIMAIRPO foreign key (OriginAirportID)
      references DimAirport (AirportID)
go

alter table FactFlight
   add constraint FK_FACTFLIG_DISTANCEG_DIMDISTA foreign key (DistanceRangeID)
      references DimDistanceRange (DistanceRangeID)
go

alter table FactFlight
   add constraint FK_FACTFLIG_FLIGHTDAT_DIMDATE foreign key (FlightDateID)
      references DimDate (DateID)
go

alter table FactFlight
   add constraint FK_FACTFLIG_ORIGINAIR_DIMAIRPO foreign key (DestinationAirportID)
      references DimAirport (AirportID)
go

alter table FactFlight
   add constraint FK_FACTFLIG_WHEELSOFF_DIMTIME foreign key (DepartureTimeID)
      references DimTime (TimeID)
go

alter table FactFlight
   add constraint FK_FACTFLIG_WHEELSON_DIMTIME foreign key (WheelsOffID)
      references DimTime (TimeID)
go

