@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Projections'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z08_Demo01 //Kommentare max. 30 Zeichen
  as select from /dmo/connection

{
      /* Key Fields */
  key carrier_id      as CarrierId,
  key connection_id   as ConnectionId,

      airport_from_id as AirportFromId,
      airport_to_id   as AirportToId,
      //      departure_time  as DepartureTime,
      //      arrival_time    as ArrivalTime,
      distance        as Distance,
      distance_unit   as DistanceUnit
}
