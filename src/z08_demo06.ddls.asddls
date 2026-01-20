@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Outer Joints'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z08_DEMO06
  as select from /dmo/connection as c
    left outer join   /dmo/carrier    as a on c.carrier_id = a.carrier_id
    left outer join   /dmo/flight     as f on  f.carrier_id    = c.carrier_id
                                      and f.connection_id = c.connection_id

{
  key a.carrier_id      as CarrierId,
  key c.connection_id   as ConnectionId,
  key f.flight_date     as FlightDate,
      a.name            as Name,
      c.airport_from_id as AirportFromId,
      c.airport_to_id   as AirportToId

}
