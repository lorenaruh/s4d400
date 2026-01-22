@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Movies'

define root view entity ZR_08_MovieTP
  as select from ZI_08_Movie
  
  
  association[1..1] to ZI_08_AverageRating as _AverageRating on $projection.MovieUuid = _AverageRating.MovieUuid

  composition [0..*] of ZR_08_RatingTP as _Ratings

{
  key MovieUuid,

      Title,
      Genre,
      PublishingYear,
      RuntimeInMin,

      ImageUrl,
      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,
      
      /* Transient Data */
//     case _AverageRating
//     when _AverageRating > 6.7 then 3
//    when _AverageRating > 3.4 then 2
//    when _AverageRating > 0 then 1
//    else 0 end                  as AverageRatingCriticality,
      _AverageRating.AverageRating,
      _AverageRating.AverageRatingCriticality,
      
      /* Associations */
      _Ratings
}
