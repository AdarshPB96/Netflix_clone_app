// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coming_soon_movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComingsoonMovies _$ComingsoonMoviesFromJson(Map<String, dynamic> json) =>
    ComingsoonMovies(
      json['backdrop_path'] as String?,
      json['original_title'] as String?,
      json['overview'] as String?,
      json['release_date'] as String?,
    );

Map<String, dynamic> _$ComingsoonMoviesToJson(ComingsoonMovies instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'original_title': instance.originalTitle,
      'overview': instance.overView,
      'release_date': instance.releaseDate,
    };
