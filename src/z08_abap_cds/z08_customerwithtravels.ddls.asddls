@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Customer with Travels'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z08_CustomerWithTravels
  as select from Z08_Customer

  association [0..*] to /dmo/travel as _Travels  // [1..1] gibt 1:1-Beziehung an
    on $projection.CustomerId = _Travels.customer_id

{
  key CustomerId,

      FirstName,
      LastName,
      Title,
      Street,
      PostalCode,
      City,
      CountryCode,

      // Associations
      _Travels
}

where CountryCode = 'DE'
