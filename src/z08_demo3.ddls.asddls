@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Operatoren, Verzweigungen, Built in Functions'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z08_Demo3
  as select from /dmo/connection as c
    inner join   /dmo/flight     as f on  c.carrier_id    = f.carrier_id
                                      and c.connection_id = f.connection_id
{
  key c.carrier_id                                                   as CarrierId,
  key c.connection_id                                                as ConnectionId,

      /* Literals and Casts */
      
      'Hello World'                                                  as TextLiteral,
      42                                                             as NumberLiteral,
      0.1                                                            as Fltp,
      f.seats_max - f.seats_occupied                                 as FreeSeats,
      
      @EndUserText.label: 'Carrier Id'
      @EndUserText.quickInfo: 'Carrier Id'
      'LH' as Char3,
      cast('LH' as /dmo/carrier_id) as CarrierId2,
      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      f.price                                                        as OldPrice,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      f.price*2                                                      as DoublePrice,
      cast(f.price as abap.fltp) * 1.1                               as NewPrice,
      cast(f.price as abap.dec(16,2)) * cast('1.1' as abap.dec(4,1)) as NewPrice2,
      f.currency_code                                                as CurrencyCode,
      f.seats_max                                                    as SeatsMax,
      f.seats_occupied                                               as OccupiedSeats,
      f.seats_occupied / f.seats_max                                 as OccupancyRate,

      /* Cases (Verzweigungen) */
      c.distance                                                     as Distance,
      c.distance_unit                                                as DistanceUnit,

      case when c.distance < 1000 then 'Kurzstreckenflug'
      when c.distance < 5000 then 'Mittelstreckenflug'
      else 'Langstreckenflug'
      end                                                            as DistanceText,

      case f.currency_code when 'EUR' then 'Euro'
      when 'SGD' then  'Singapur Dollar'
      when 'USD' then 'Ammi Dollar'
      else 'ebs andres'

      end                                                            as CurrencyCodeText,
      
      /* Built-In Functions */
      division(f.seats_occupied, f.seats_max, 2) as OccupancyRate2,
      length('  ') as SSS,
      length('  X') as SSX,
      length('X  ') as XSS, //Nachfolgende Leerzeichen, zählen nicht mit
      
      
      /* Währungs- und Einheitenumrechnung */
      
      @Semantics.amount.currencyCode: 'CurrencyCode2'
      currency_conversion(
      amount => f.price,
      source_currency => f.currency_code,
      target_currency => cast('EUR' as abap.cuky),
      exchange_rate_date => f.flight_date,
      error_handling => 'SET_TO_NULL' ) as ConvertedPrice,
      cast('EUR' as abap.cuky) as CurrencyCode2
      

}
