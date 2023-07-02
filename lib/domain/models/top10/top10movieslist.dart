import 'package:json_annotation/json_annotation.dart';
import 'package:netflix_app/domain/models/top10/topten_movies.dart';

part 'top10movieslist.g.dart';

@JsonSerializable()
class Top10MoviesList {
  @JsonKey(name: "results")
  List<Top10>? data;
  Top10MoviesList({this.data});
  factory Top10MoviesList.fromJson(Map<String, dynamic> json) {

    return _$Top10MoviesListFromJson(json);
  }

}
