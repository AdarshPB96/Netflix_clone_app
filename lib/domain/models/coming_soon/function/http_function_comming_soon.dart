import 'dart:convert';

import 'package:http/http.dart' as http;

import '../coming_soon_movies.dart';
import '../coming_soon_movieslist.dart';


Future<List<ComingsoonMovies>> getallComingsoonmivies(String key) async {
  String csbaseurl = 'https://api.themoviedb.org/3/movie/upcoming?api_key=';
  final response = await http.get(Uri.parse(csbaseurl + key));
  if (response.statusCode == 200) {
    final value = jsonDecode(response.body) as Map<String, dynamic>;
    final data = ComingsoonMoviesList.fromJson(value);
    return data.data ?? [];
  }
  return [];
}
