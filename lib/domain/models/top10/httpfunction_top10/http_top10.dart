import 'dart:convert';

import 'package:http/http.dart' as http;



import '../top10movieslist.dart';
import '../topten_movies.dart';

Future<List<Top10>> getallTop10Movies(String key) async {
  String baseurl = 'https://api.themoviedb.org/3/movie/top_rated?api_key=';
  final response = await http.get(Uri.parse(baseurl + key));
  if (response.statusCode == 200) {
    final value = jsonDecode(response.body) as Map<String, dynamic>;

    final data = Top10MoviesList.fromJson(value);
    return data.data ?? [];

    // final List<Top10> toptenmovielist = data.values.toList()

    // final List<Top10> movieslist = [];
    // for (var element in data) {
    //   final movie = Top10.fromJson(element);
    //   movieslist.add(movie);
    // // }
    // return movieslist;
  } else {
    throw Exception("failed to fetch");
  }
  
}
