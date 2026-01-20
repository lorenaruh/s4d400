@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Customer KPIs'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z08_CustomerKPIs
  as select from Z08_TravelWithCustomer as twc

{
  key twc.CustomerId,

      twc.CustomerName                                   as CustomerName,
      twc.Street,
      twc.PostalCode,
      twc.City,

      // Total Revenue
      @EndUserText.label: 'TotalRevenue'
      @EndUserText.quickInfo: 'TotalRevenue'
      @Semantics.amount.currencyCode: 'CurrencyCode'
      sum(twc.BookingFeeInEuros + twc.TotalPriceInEuros) as TotalRevenue,

      twc.CurrencyCode,

      // AverageDuration
      @EndUserText.label: 'AverageDuration'
      @EndUserText.quickInfo: 'AverageDuration'
      avg(twc.Duration as abap.dec(15,2))                as AverageDuration,

      // NumberOfDifferentAgencys
      @EndUserText.label: 'NumberOfDifferentAgencys'
      @EndUserText.quickInfo: 'NumberOfDifferentAgencys'
      count(distinct twc.AgencyId)                       as NumberOfDifferentAgencys
}

group by CustomerId,
         CustomerName,
         Street,
         PostalCode,
         City,
         CurrencyCode

having sum(twc.BookingFeeInEuros + twc.TotalPriceInEuros) >= 5000
