@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Movie'

@Metadata.allowExtensions: true

@Search.searchable: true

define root view entity ZC_08_MovieTP
  as projection on ZR_08_MovieTP

{
  key MovieUuid,


      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Title,

      Genre,
      PublishingYear,
      RuntimeInMin,
      ImageUrl,
      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,
      
      /* Transistent Data */
      AverageRating,
      AverageRatingCriticality,

      /* Associations */
      _Ratings : redirected to composition child ZC_08_RatingTP
}
