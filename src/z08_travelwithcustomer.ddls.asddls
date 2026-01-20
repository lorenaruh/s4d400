@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel with Customer'
//@Metadata.ignorePropagatedAnnotations: true
define view entity Z08_TravelWithCustomer
  as select from Z08_Travel   as t
    inner join   Z08_Customer as c on t.CustomerId = c.CustomerId
//    left outer join dd07t as statustext
//        on statustext.domname    = 'Z08_STATUS'        // Domänenname von Status
//       and statustext.as4local   = 'A'                 // Aktive Version
//       and statustext.     = t.Status            // Status-Feld aus Tabelle
//       and statustext.ddlanguage = $session.system_language // Logonsprache
    
{
  key t.TravelId,
      t.BeginDate,
      t.EndDate,
      dats_days_between(t.BeginDate, t.EndDate) as Duration,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(
      amount => t.BookingFee,
      source_currency => t.CurrencyCode,
      target_currency => cast('EUR' as abap.cuky),
      exchange_rate_date => $session.system_date ) as BookingFeeInEuros,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(
      amount => t.TotalPrice,
      source_currency => t.CurrencyCode,
      target_currency => cast('EUR' as abap.cuky),
      exchange_rate_date => $session.system_date ) as TotalPriceInEuros,
      cast('EUR' as abap.cuky) as CurrencyCode,
      t.Description,
      
      
      /*
      'B' Booked
      'N' New
      'P' Planned
      'X' Cancelled
      */
      case when t.Status = 'B' then 'Booked'
      when t.Status = 'N' then 'New'
       when t.Status = 'P' then 'Planned'
        when t.Status = 'X' then 'Cancelled'
      else 'No Status available'
      end as StatusText,
//      t.Status.ddtext as StatusText, 
      c.CustomerId,
//      c.FirstName,
//      c.LastName,
//      c.Title,
      case when c.Title is initial then concat_with_space(c.FirstName, c.LastName, 1)
      else concat_with_space(c.FirstName, concat_with_space(c.FirstName, c.LastName, 1), 1)
      end    
      as CustomerName,
      c.Street,
      c.PostalCode,
      c.City
}
where
  c.CountryCode = 'DE'
