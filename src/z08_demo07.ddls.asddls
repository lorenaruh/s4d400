@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'CDS Special Views with parameters'

define view entity Z08_Demo07
  with parameters
    P_CarrierId : /dmo/carrier_id,
    @Environment.systemField: #SYSTEM_DATE //Standart angeben, damit nicht mehr eingeben müssen
    P_Deadline : abap.dats

  as select from /dmo/flight

{
  key carrier_id     as CarrierId,
  key connection_id  as ConnectionId,
  key flight_date    as FlightDate,

      price          as Price,
      currency_code  as CurrencyCode,
      plane_type_id  as PlaneTypeId,
      seats_max      as SeatsMax,
      seats_occupied as SeatsOccupied
}

//where
//carrier_id = 'LH' //Auslagern in Parameter möglich
where carrier_id = $parameters.P_CarrierId
and flight_date > $parameters.P_Deadline
