@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel with Customer'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z08_TravelWithCustomer as select from Z08_Travel as t
    inner join   Z08_Customer    as c on t.CustomerId = c.CustomerId
{
  key c.CustomerId,
  key t.TravelId,
  t.AgencyId,
  c.FirstName,
  c.LastName,
  c.Title,
  c.Street,
  c.PostalCode,
  c.City,
  c.CountryCode,
  t.BeginDate,
  t.EndDate,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  t.BookingFee,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  t.TotalPrice,
  t.CurrencyCode,
  t.Description,
  t.Status
}
where c.CountryCode = 'DE'
