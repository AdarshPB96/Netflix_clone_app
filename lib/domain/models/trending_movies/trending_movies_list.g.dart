// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_movies_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingMoviesList _$TrendingMoviesListFromJson(Map<String, dynamic> json) =>
    TrendingMoviesList(
      data: (json['results'] as List<dynamic>?)
          ?.map((e) => TrendingMovies.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrendingMoviesListToJson(TrendingMoviesList instance) =>
    <String, dynamic>{
      'results': instance.data,
    };
