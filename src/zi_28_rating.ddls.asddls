@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'a'

define view entity ZI_28_Rating
  as select from ZR_28_Rating

  association to parent ZI_28_Movie as _Movie on $projection.MovieUuid = _Movie.MovieUuid

{
  key RatingUuid,

      MovieUuid,
      UserName,
      Rating,
      RatingDate,

      _Movie // Make association public
}
