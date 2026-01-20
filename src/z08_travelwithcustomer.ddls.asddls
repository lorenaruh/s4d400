@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel with Customer'
//@Metadata.ignorePropagatedAnnotations: true

define view entity Z08_TravelWithCustomer
  as select from Z08_Travel   as t

    inner join   Z08_Customer as c on t.CustomerId = c.CustomerId
    inner join   DDCDS_CUSTOMER_DOMAIN_VALUE_T(
                   p_domain_name : '/DMO/STATUS') as s
      on  s.value_low = t.Status
      and s.language  = $session.system_language

{
  key t.TravelId,

      t.BeginDate,
      t.EndDate,

      @EndUserText.label: 'Duration'
      @EndUserText.quickInfo: 'Duration'
      dats_days_between(t.BeginDate, t.EndDate) + 1                   as Duration,

      @EndUserText.label: 'BookingFee in Euros'
      @EndUserText.quickInfo: 'BookingFee in Euros'
      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(amount             => t.BookingFee,
                          source_currency    => t.CurrencyCode,
                          target_currency    => cast('EUR' as abap.cuky),
                          exchange_rate_date => $session.system_date) as BookingFeeInEuros,

      @EndUserText.label: 'Total Price in Euros'
      @EndUserText.quickInfo: 'Total Price in Euros'
      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(amount             => t.TotalPrice,
                          source_currency    => t.CurrencyCode,
                          target_currency    => cast('EUR' as abap.cuky),
                          exchange_rate_date => $session.system_date) as TotalPriceInEuros,

      
      cast('EUR' as /dmo/currency_code)                                        as CurrencyCode,

      t.Description,


      /*
      Hardcodiert
      'B' Booked
      'N' New
      'P' Planned
      'X' Cancelled
      */
      //Hardcodiert
//      case when t.Status = 'B' then 'Booked'
//      when t.Status = 'N' then 'New'
//       when t.Status = 'P' then 'Planned'
//        when t.Status = 'X' then 'Cancelled'
//      else 'No Status available'
//      end  
      
      
      @EndUserText.label: 'Status Text'
      @EndUserText.quickInfo: 'Status Text'
      s.text                                                           as StatusText,

      c.CustomerId,

      //      c.FirstName,
      //      c.LastName,
      //      c.Title,
            @EndUserText.label: 'Customer Name'
      @EndUserText.quickInfo: 'Customer Name'
      case when c.Title is initial then concat_with_space(c.FirstName, c.LastName, 1)
      else concat_with_space(c.Title, concat_with_space(c.FirstName, c.LastName, 1), 1)
      end                                                             as CustomerName,

      c.Street,
      c.PostalCode,
      c.City
}

where c.CountryCode = 'DE'
