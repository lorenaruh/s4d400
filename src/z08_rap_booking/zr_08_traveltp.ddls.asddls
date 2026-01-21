@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel'

define root view entity ZR_08_TravelTP
  as select from ZI_08_Travel
  
  composition [0..*] of ZR_08_BOOKINGTP as _Bookings

{
  key TravelId,

      AgencyId,
      CustomerId,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      CurrencyCode,
      Description,
      Status,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      
      /* Associations */
      _Bookings
}
