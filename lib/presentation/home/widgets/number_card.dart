// import 'package:bordered_text/bordered_text.dart';
// import 'package:flutter/material.dart';
// import 'package:netflix_app/core/colors/colors.dart';

// class NumberCard extends StatelessWidget {
//   final int index;
//   const NumberCard({required this.index, super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     const imageurl =
//         "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg";
//     return Stack(
//       children: [
//         Row(
//           children: [
//             const SizedBox(
//               width: 50,
//             ),
//             Container(
//               height: size.height,
//               width: size.width * 0.3,
//               decoration: BoxDecoration(
//                   image: const DecorationImage(
//                       image: NetworkImage(imageurl), fit: BoxFit.cover),
//                   borderRadius: BorderRadius.circular(7)),
//             ),
//           ],
//         ),
//         Positioned(
//             left: 10,
//             bottom: 10,
//             child: BorderedText(
//               strokeColor: Colors.white,
//               child: Text(
//                 "${index + 1}",
//                 style: const TextStyle(
//                   fontSize: 100,
//                   fontWeight: FontWeight.bold,
//                   color: kBlackColor,
//                 ),
//               ),
//             ))
//       ],
//     );
//   }
// }



import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';

import '../../../core/colors/colors.dart';
import '../../../domain/models/top10/httpfunction_top10/http_top10.dart';
import '../../../domain/models/top10/topten_movies.dart';

class Top10TvShoesWidget extends StatelessWidget {
  const Top10TvShoesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    List<Top10>? top10list;
    return FutureBuilder(
      future: getallTop10Movies(apikey),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          top10list = snapshot.data;
        }
        return SizedBox(
          height: 200,
          width: size.width,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? const SizedBox()
                    : Stack(
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 50,
                              ),
                              top10list?[index].posterPath != null
                                  ? Container(
                                      height: size.height,
                                      width: size.width * 0.3,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(imagepath +
                                                  top10list![index]
                                                      .posterPath!),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                    )
                                  : Container(
                                      color: Colors.red,
                                      height: 20,
                                      width: 10,
                                    ),
                            ],
                          ),
                          Positioned(
                              left: 10,
                              bottom: 10,
                              child: BorderedText(
                                strokeColor: Colors.white,
                                child: Text(
                                  "${index + 1}",
                                  style: const TextStyle(
                                    fontSize: 100,
                                    fontWeight: FontWeight.bold,
                                    color: kBlackColor,
                                  ),
                                ),
                              ))
                        ],
                      );
              },
              separatorBuilder: (context, index) => kwidth,
              itemCount: 10),
        );
      },
    );
  }
}
