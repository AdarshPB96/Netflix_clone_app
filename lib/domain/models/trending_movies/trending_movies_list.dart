import 'package:json_annotation/json_annotation.dart';
import 'package:netflix_app/domain/models/trending_movies/trending_movies.dart';


part 'trending_movies_list.g.dart';

@JsonSerializable()
class TrendingMoviesList {
  @JsonKey(name: 'results')
  List<TrendingMovies>? data;

  TrendingMoviesList({this.data});

  factory TrendingMoviesList.fromJson(Map<String, dynamic> json) {
    return _$TrendingMoviesListFromJson(json);
  }

  // Map<String, dynamic> toJson() => _$TrendingMoviesListToJson(this);
}
