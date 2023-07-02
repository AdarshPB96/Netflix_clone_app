import 'package:json_annotation/json_annotation.dart';

part 'trending_movies.g.dart';

@JsonSerializable()
class TrendingMovies {
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: "original_title")
  String? originaltitle;
  @JsonKey(name: 'title')
  String? title;

  TrendingMovies({
    this.posterPath,
    this.originaltitle,
    this.title,
  });

  factory TrendingMovies.fromJson(Map<String, dynamic> json) {
    return _$TrendingMoviesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TrendingMoviesToJson(this);
}
