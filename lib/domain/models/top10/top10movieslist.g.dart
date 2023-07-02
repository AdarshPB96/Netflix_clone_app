// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top10movieslist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Top10MoviesList _$Top10MoviesListFromJson(Map<String, dynamic> json) =>
    Top10MoviesList(
      data: (json['results'] as List<dynamic>?)
          ?.map((e) => Top10.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$Top10MoviesListToJson(Top10MoviesList instance) =>
    <String, dynamic>{
      'results': instance.data,
    };
