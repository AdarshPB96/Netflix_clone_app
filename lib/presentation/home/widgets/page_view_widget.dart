import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';

import 'package:netflix_app/models/trending_movies/trending_movies.dart';

import '../../../domain/models/trending_movies/function/http_function.dart';
import '../../../domain/models/trending_movies/trending_movies.dart';


class PageViewWidget extends StatelessWidget {
  const PageViewWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    List<TrendingMovies>? trendingList;
    return FutureBuilder(
        future: getallTrendingMovies(apikey),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            trendingList = snapshot.data;
          }
// if(trendingList != null){
//   for(TrendingMovies item in trendingList!){
//   if(item.posterPath != null && pageviewlist.value.contains(item.posterPath) && pageviewlist.value.length < 3){
//     pageviewlist.value.add(item.posterPath!);

//    break;}
//   }
//   Timer(const Duration(seconds: 1), () { pageviewlist.notifyListeners(); });
// }

          return SizedBox(
            height: 200,
            width: size.width,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    snapshot.connectionState == ConnectionState.waiting
                        ? const SizedBox()
                        : trendingList?[index].posterPath != null
                            ? Container(
                                height: size.height,
                                width: size.width * 0.3,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(imagepath +
                                            trendingList![index].posterPath!),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(7)),
                              )
                            : Container(
                                height: size.height,
                                width: size.width * 0.3,
                                child: Text(
                                  "could,t find",
                                  style: TextStyle(color: kwhitecolor),
                                ),
                              ),
                separatorBuilder: (context, index) => kwidth,
                itemCount: 10),
          );
        });
  }
}
