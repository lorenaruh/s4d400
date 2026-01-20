@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Associosiations'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z08_DEMO08
  as select from /dmo/connection

  association [1..1] to /dmo/carrier as _Carrier  // [1..1] gibt 1:1-Beziehung an
    on $projection.CarrierId = _Carrier.carrier_id

  association [0..*] to        /dmo/flight  as _Flights
    on  _Flights.carrier_id    = $projection.CarrierId
    and _Flights.connection_id = $projection.ConnectionId

{
//  key /dmo/connection.carrier_id as CarrierId,
  key carrier_id as CarrierId,
  key connection_id       as ConnectionId,
//  key _Flights.flight_date       as FlightDate,
//
//      _Carrier.name       as Name,
      airport_from_id     as AirportFromId,
      airport_to_id       as AirportToId,
      
      /* Association (joins on demand) */
      _Carrier,
      _Flights
}
