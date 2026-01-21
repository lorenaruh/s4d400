@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Rating'

define view entity ZR_08_RatingTP
  as select from ZI_08_Rating

  association to parent ZR_08_MovieTP as _Movie on $projection.MovieUuid = _Movie.MovieUuid

{
  key RatingUuid,

      MovieUuid,
      UserName,
      Rating,
      RatingDate,

      /* Associations */
      _Movie // Make association public
}
