import 'package:json_annotation/json_annotation.dart';
part 'coming_soon_movies.g.dart';
@JsonSerializable()
class ComingsoonMovies {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  @JsonKey(name: 'overview')
  String? overView;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  ComingsoonMovies(
    this.backdropPath, this.originalTitle, this.overView, this.releaseDate);
      factory ComingsoonMovies.fromJson(Map<String, dynamic> json) {
        return _$ComingsoonMoviesFromJson(json);
      }
    Map<String, dynamic> toJson(){return
    _$ComingsoonMoviesToJson(this);
    }
}
