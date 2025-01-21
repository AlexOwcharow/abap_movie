@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'a'

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
define root view entity ZI_28_Movie
  as select from ZR_28_Movie2

  association [1..1] to ZI_28_GerneText     as _GenreText     on $projection.Genre = _GenreText.value_low
  association [0..1] to ZI_28_AverageRating as _AverageRating on $projection.MovieUuid = _AverageRating.MovieUUID
  composition [0..*] of ZI_28_Rating as _Ratings

{
  key MovieUuid,

      Title,

      @ObjectModel.text.element: [ 'GenreText' ]
      Genre,

      PublishingYear,
      RuntimeInMin,
      ImageUrl,
      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,

      /* Transient Data */
      _GenreText.text               as GenreText,
      _AverageRating.AverageRating,

      case when _AverageRating.AverageRating > 6.6 then 3
          when _AverageRating.AverageRating > 3.3 then 2
          when _AverageRating.AverageRating > 0 then 1
          else 0
      end                           as AverageRatingCriticality,

      _Ratings
// _association_name // Make association public
}
