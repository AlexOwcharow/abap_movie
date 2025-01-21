@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'a'

@Metadata.allowExtensions: true

@Search.searchable: true

define root view entity ZC_28_Movie
provider contract transactional_query
  as projection on ZI_28_Movie

{
  key MovieUuid,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Title,

      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZI_28_GenreVH', element: 'value_low' } } ]
      Genre,

      PublishingYear,
      RuntimeInMin,

      @Semantics.imageUrl: true
      ImageUrl,

      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,

      /*Transient Text*/
      GenreText,
      AverageRating,
      AverageRatingCriticality,

      /*Associations*/
      _Ratings : redirected to composition child ZC_28_Rating
}
