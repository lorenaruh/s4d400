@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Average Rating'

define view entity ZI_08_AverageRating
  as select from zabap_rating_a

{
  key movie_uuid                   as MovieUuid,

      @EndUserText.label: 'AverageRating'
      @EndUserText.quickInfo: 'AverageRating'
      avg(rating as abap.dec(4,1)) as AverageRating,


      case
        when avg(rating as abap.dec(16,1)) > 6.7 then 3
        when avg(rating as abap.dec(16,1)) > 3.4 then 2
        when avg(rating as abap.dec(16,1)) > 0 then 1
        else 0 end                 as AverageRatingCriticality
}

group by movie_uuid
