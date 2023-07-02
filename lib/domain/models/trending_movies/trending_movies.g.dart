// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingMovies _$TrendingMoviesFromJson(Map<String, dynamic> json) =>
    TrendingMovies(
      posterPath: json['poster_path'] as String?,
      originaltitle: json['original_title'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$TrendingMoviesToJson(TrendingMovies instance) =>
    <String, dynamic>{
      'poster_path': instance.posterPath,
      'original_title': instance.originaltitle,
      'title': instance.title,
    };
