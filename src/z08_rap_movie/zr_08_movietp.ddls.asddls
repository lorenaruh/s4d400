@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Movies'

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
define root view entity ZR_08_MovieTP
  as select from ZI_08_Movie

  association [0..1] to ZI_08_AverageRating as _AverageRating on $projection.MovieUuid = _AverageRating.MovieUuid
  association [0..1] to ZI_08_GenreText     as _GenreText     on $projection.Genre = _GenreText.Genre
  composition [0..*] of ZR_08_RatingTP      as _Ratings

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
      _AverageRating.AverageRating,
      _AverageRating.AverageRatingCriticality,

      /* Associations */
      _Ratings,
      _AverageRating,
      _GenreText
}
