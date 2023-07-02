import 'package:json_annotation/json_annotation.dart';

import 'coming_soon_movies.dart';

part 'coming_soon_movieslist.g.dart';
@JsonSerializable()
class ComingsoonMoviesList {
  @JsonKey(name: 'results')
  List<ComingsoonMovies>? data;
  ComingsoonMoviesList({this.data});
 factory ComingsoonMoviesList.fromJson(Map<String, dynamic> json) => _$ComingsoonMoviesListFromJson(json);
//  Map<String, dynamic> toJson(){
//   return _$ComingsoonMoviesListFromJson(this);
//  }
}
