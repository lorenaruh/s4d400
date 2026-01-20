@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Path Expressions'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z08_Demo09
  as select from Z08_DEMO08

{
  key CarrierId,
  key ConnectionId,

      AirportFromId,
      AirportToId,
      _Carrier.name as Name,

      /* Associations */
      _Carrier,
      _Flights
}
