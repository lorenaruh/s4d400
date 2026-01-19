@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel with Customer'
//@Metadata.ignorePropagatedAnnotations: true
define view entity Z08_TravelWithCustomer
  as select from Z08_Travel   as t
    inner join   Z08_Customer as c on t.CustomerId = c.CustomerId
{
  key t.TravelId,
      t.BeginDate,
      t.EndDate,
      t.BookingFee,
      t.TotalPrice,
      t.CurrencyCode,
      t.Description,
      t.Status,
      c.CustomerId,
      t.AgencyId,
      c.FirstName,
      c.LastName,
      c.Title,
      c.Street,
      c.PostalCode,
      c.City,
      c.CountryCode
}
where
  c.CountryCode = 'DE'
