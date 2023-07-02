
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix_app/models/trending_movies/trending_movies.dart';

import '../trending_movies.dart';
import '../trending_movies_list.dart';


Future<List<TrendingMovies>> getallTrendingMovies(String key) async {
  String baseurl = "https://api.themoviedb.org/3/trending/movie/day?api_key=";
  final response = await http.get(Uri.parse(baseurl + key));
  if (response.statusCode == 200) {
    final value = jsonDecode(response.body) as Map<String, dynamic>;
    final data = TrendingMoviesList.fromJson(value);
    return data.data ?? [];
  }
  return [];
}
