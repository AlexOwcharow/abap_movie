@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'a'

define view entity ZI_28_AverageRating
  as select from zabap_rating_a

{
  key movie_uuid                   as MovieUUID,
  
  @EndUserText: {label: 'AverageRating', quickInfo:'Average Rating (1-10)'}
      avg(rating as abap.dec(4,1)) as AverageRating
}
group by
 movie_uuid
