@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Booking'

define view entity ZC_08_BOOKINGTP
  as projection on ZR_08_BOOKINGTP

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

      /* Associations */
      _Travel: redirected to parent ZC_08_TravelTP
}
