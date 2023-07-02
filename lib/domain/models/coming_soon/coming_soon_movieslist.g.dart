// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coming_soon_movieslist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComingsoonMoviesList _$ComingsoonMoviesListFromJson(
        Map<String, dynamic> json) =>
    ComingsoonMoviesList(
      data: (json['results'] as List<dynamic>?)
          ?.map((e) => ComingsoonMovies.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComingsoonMoviesListToJson(
        ComingsoonMoviesList instance) =>
    <String, dynamic>{
      'results': instance.data,
    };
