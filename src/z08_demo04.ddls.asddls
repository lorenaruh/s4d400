@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Dmain Fixed Values'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z08_Demo04
  as select from /dmo/travel                      as t

    inner join   DDCDS_CUSTOMER_DOMAIN_VALUE_T(
                   p_domain_name : '/DMO/STATUS') as s
      on  s.value_low = t.status
      and s.language  = $session.system_language

{
  key t.travel_id as TravelId,

      t.status    as Status,
      s.text      as StatusText
}
