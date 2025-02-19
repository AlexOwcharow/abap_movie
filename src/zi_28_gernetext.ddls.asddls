@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'a'

define view entity ZI_28_GerneText as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: 'ZABAP_GENRE' )
{
  key domain_name,
  key value_position,
  key language,
  value_low,
  text
}
where language = $session.system_language
