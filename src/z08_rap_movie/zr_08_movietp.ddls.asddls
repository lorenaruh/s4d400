@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Movies'

define view entity ZR_08_MovieTP
  as select from ZI_08_Movie

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
      LastChangedBy
}
