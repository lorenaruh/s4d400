@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Booking'

define view entity ZR_08_BOOKINGTP
  as select from ZI_08_BOOKING

  association to parent ZR_08_TravelTP as _Travel on $projection.TravelId = _Travel.TravelId

{
  key TravelId,
  key BookingId,

      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      FlightPrice,
      CurrencyCode,

      /* Association */
      _Travel // Make association public
}
