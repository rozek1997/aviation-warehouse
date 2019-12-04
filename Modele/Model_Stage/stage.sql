/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2017                    */
/* Created on:     02.12.2019 15:41:52                          */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('AIRLINES')
            and   type = 'U')
   drop table AIRLINES
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AIRPORT')
            and   type = 'U')
   drop table AIRPORT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AIRPORTS')
            and   type = 'U')
   drop table AIRPORTS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CITYMARKETID')
            and   type = 'U')
   drop table CITYMARKETID
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DISTANCEGROUP250')
            and   type = 'U')
   drop table DISTANCEGROUP250
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FACTFLIGHT')
            and   type = 'U')
   drop table FACTFLIGHT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ONTIMEDELAYGROUPS')
            and   type = 'U')
   drop table ONTIMEDELAYGROUPS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('UNIQUECARRIERS')
            and   type = 'U')
   drop table UNIQUECARRIERS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('WORLDAREACODES')
            and   type = 'U')
   drop table WORLDAREACODES
go

/*==============================================================*/
/* Table: AIRLINES                                              */
/*==============================================================*/
create table AIRLINES (
   AIRLINEID            varchar(1024)        null,
   NAME                 varchar(1024)        null,
   ALIAS                varchar(1024)        null,
   IATA                 varchar(1024)        null,
   ICAO                 varchar(1024)        null,
   CALLSIGN             varchar(1024)        null,
   COUNTRY              varchar(1024)        null,
   ACTIVE               varchar(1024)        null
)
go

/*==============================================================*/
/* Table: AIRPORT                                               */
/*==============================================================*/
create table AIRPORT (
   CODE                 varchar(1024)        null,
   DESCRIPTION          varchar(1024)        null
)
go

/*==============================================================*/
/* Table: AIRPORTS                                              */
/*==============================================================*/
create table AIRPORTS (
   AIRPORTID            varchar(1024)        null,
   NAME                 varchar(1024)        null,
   CITY                 varchar(1024)        null,
   COUNTRY              varchar(1024)        null,
   IATA                 varchar(1024)        null,
   ICAO                 varchar(1024)        null,
   LATITUDE             varchar(1024)        null,
   LONGITUDE            varchar(1024)        null,
   ALTITUDE             varchar(1024)        null,
   TIMEZONE             varchar(1024)        null,
   DST                  varchar(1024)        null,
   TZDATABASETIMEZONE   varchar(1024)        null,
   TYPE                 varchar(1024)        null
)
go

/*==============================================================*/
/* Table: CITYMARKETID                                          */
/*==============================================================*/
create table CITYMARKETID (
   CODE                 varchar(1024)        null,
   DESCRIPTION          varchar(1024)        null
)
go

/*==============================================================*/
/* Table: DISTANCEGROUP250                                      */
/*==============================================================*/
create table DISTANCEGROUP250 (
   CODE                 varchar(1024)        null,
   DESCRIPTION          varchar(1024)        null
)
go

/*==============================================================*/
/* Table: FACTFLIGHT                                            */
/*==============================================================*/
create table FACTFLIGHT (
   YEAR                 varchar(1024)        null,
   QUARTER              varchar(1024)        null,
   MONTH                varchar(1024)        null,
   DAYOFMONTH           varchar(1024)        null,
   DAYOFWEEK            varchar(1024)        null,
   FLIGHTDATE           varchar(1024)        null,
   REPORTING_AIRLINE    varchar(1024)        null,
   DOT_ID_REPORTING_AIRLINE varchar(1024)        null,
   IATA_CODE_REPORTING_AIRLINE varchar(1024)        null,
   TAIL_NUMBER          varchar(1024)        null,
   FLIGHT_NUMBER_REPORTING_AIRLINE varchar(1024)        null,
   ORIGINAIRPORTID      varchar(1024)        null,
   ORIGINAIRPORTSEQID   varchar(1024)        null,
   ORIGINCITYMARKETID   varchar(1024)        null,
   ORIGIN               varchar(1024)        null,
   ORIGINCITYNAME       varchar(1024)        null,
   ORIGINSTATEABRCOPY   varchar(1024)        null,
   ORIGINSTATEABR       varchar(1024)        null,
   ORIGINSTATEFIPS      varchar(1024)        null,
   ORIGINSTATENAME      varchar(1024)        null,
   ORIGINWAC            varchar(1024)        null,
   DESTAIRPORTID        varchar(1024)        null,
   DESTAIRPORTSEQID     varchar(1024)        null,
   DESTCITYMARKETID     varchar(1024)        null,
   DEST                 varchar(1024)        null,
   DESTCITYNAME         varchar(1024)        null,
   DESTSTATEABRCOPY     varchar(1024)        null,
   DESTSTATEABR         varchar(1024)        null,
   DESTSTATEFIPS        varchar(1024)        null,
   DESTSTATENAME        varchar(1024)        null,
   _DESTWAC             varchar(1024)        null,
   CRSDEPTIME           varchar(1024)        null,
   DEPTIME              varchar(1024)        null,
   DEPDELAY             varchar(1024)        null,
   DEPDELAYMINUTES      varchar(1024)        null,
   DEPDEL15             varchar(1024)        null,
   DEPARTUREDELAYGROUPS varchar(1024)        null,
   DEPTIMEBLK           varchar(1024)        null,
   TAXIOUT              varchar(1024)        null,
   WHEELSOFF            varchar(1024)        null,
   WHEELSON             varchar(1024)        null,
   _TAXIIN              varchar(1024)        null,
   CRSARRTIME           varchar(1024)        null,
   _ARRTIME             varchar(1024)        null,
   ARRDELAY             varchar(1024)        null,
   ARRDELAYMINUTES      varchar(1024)        null,
   _ARRDEL15            varchar(1024)        null,
   ARRIVALDELAYGROUPS   varchar(1024)        null,
   ARRTIMEBLK           varchar(1024)        null,
   CANCELLED            varchar(1024)        null,
   CANCELLATIONCODE     varchar(1024)        null,
   DIVERTED             varchar(1024)        null,
   CRSELAPSEDTIME       varchar(1024)        null,
   ACTUALELAPSEDTIME    varchar(1024)        null,
   AIRTIME              varchar(1024)        null,
   FLIGHTS              varchar(1024)        null,
   DISTANCE             varchar(1024)        null,
   DISTANCEGROUP        varchar(1024)        null,
   CARRIERDELAY         varchar(1024)        null,
   WEATHERDELAY         varchar(1024)        null,
   NASDELAY             varchar(1024)        null,
   SECURITYDELAY        varchar(1024)        null,
   LATEAIRCRAFTDELAY    varchar(1024)        null,
   FLIGHTSTATUS         varchar(1024)        null
)
go

/*==============================================================*/
/* Table: ONTIMEDELAYGROUPS                                     */
/*==============================================================*/
create table ONTIMEDELAYGROUPS (
   CODE                 varchar(1024)        null,
   DESCRIPTION          varchar(1024)        null
)
go

/*==============================================================*/
/* Table: UNIQUECARRIERS                                        */
/*==============================================================*/
create table UNIQUECARRIERS (
   CODE                 varchar(1024)        null,
   DESCRIPTION          varchar(1024)        null
)
go

/*==============================================================*/
/* Table: WORLDAREACODES                                        */
/*==============================================================*/
create table WORLDAREACODES (
   CODE                 varchar(1024)        null,
   DESCRIPTION          varchar(1024)        null
)
go

