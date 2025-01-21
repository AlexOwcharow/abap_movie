@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'a'

@Metadata.allowExtensions: true

define view entity ZC_28_Rating
  as projection on ZI_28_Rating

{
  key RatingUuid,

      MovieUuid,
      UserName,
      Rating,
      RatingDate,

      /* Associations */
      _Movie : redirected to parent ZC_28_Movie
}
