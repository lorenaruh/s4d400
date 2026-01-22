@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Rating'

@Metadata.allowExtensions: true

define view entity ZC_08_RatingTP
  as projection on ZR_08_RatingTP

{
  key RatingUuid,

      MovieUuid,
      UserName,
      Rating,
      RatingDate,

      /* Associations */
      _Movie : redirected to parent ZC_08_MovieTP
}
