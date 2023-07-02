import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'topten_movies.g.dart';

@JsonSerializable()
class Top10 {
  @JsonKey(name: 'poster_path"')
  String? posterPath;

  Top10({this.posterPath});

  factory Top10.fromJson(Map<String, dynamic> json) {
    return _$Top10FromJson(json);
  }
  Map<String, dynamic> toJson() => _$Top10ToJson(this);
}
