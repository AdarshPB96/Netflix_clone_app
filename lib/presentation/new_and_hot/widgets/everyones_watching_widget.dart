import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/domain/models/coming_soon/coming_soon_movies.dart';



import '../../../core/colors/colors.dart';
import '../../../domain/models/coming_soon/function/http_function_comming_soon.dart';
import '../../home/widgets/icon_text_button.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  final int? index;
  const EveryonesWatchingWidget({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getallComingsoonmivies(apikey),
      builder: (context, snapshot) {
        List<ComingsoonMovies>? cominglist;
        if (snapshot.connectionState == ConnectionState.done) {
          cominglist = snapshot.data?.reversed.toList();
        }

        return snapshot.connectionState == ConnectionState.waiting ? const SizedBox()
       :  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cominglist![index!].originalTitle ?? "",
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              kheight,
              const Text(
                "Landing the lead in the school musical is a dream come true for Jodi,until the pressure sends her confidence - and her relationship - into a tailspain ",
                style: TextStyle(color: kGreyColor, fontSize: 16),
              ),
              const SizedBox(
                height: 50,
              ),
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: cominglist[index!].backdropPath != null
                        ? Image.network(
                            imagepath + cominglist[index!].backdropPath!,
                            fit: BoxFit.cover,
                          )
                        : const Text("could't find"),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.black,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.volume_off,
                            color: kwhitecolor,
                            size: 20,
                          )),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  iconWithText(
                      tIcon: Icons.share,
                      tText: "Share",
                      iconsize: 25,
                      textsize: 16),
                  kwidth,
                  iconWithText(
                      tIcon: Icons.add,
                      tText: "My List",
                      iconsize: 25,
                      textsize: 16),
                  kwidth,
                  iconWithText(
                      tIcon: Icons.play_arrow,
                      tText: "Play",
                      iconsize: 25,
                      textsize: 16),
                  kwidth,
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
