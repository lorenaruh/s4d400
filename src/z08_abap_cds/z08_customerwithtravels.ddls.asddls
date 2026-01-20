@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer with Travels'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z08_CustomerWithTravels
as select from Z08_Customer

association [0..*] to /dmo/travel as _Travels  // [1..1] gibt 1:1-Beziehung an
    on $projection.CustomerId = _Travels.customer_id
{
  key Z08_Customer.CustomerId,
  Z08_Customer.FirstName,
  Z08_Customer.LastName,
  Z08_Customer.Title,
  Z08_Customer.Street,
  Z08_Customer.PostalCode,
  Z08_Customer.City,
  Z08_Customer.CountryCode,
  
  //Associations
  _Travels
}
where CountryCode = 'DE'
