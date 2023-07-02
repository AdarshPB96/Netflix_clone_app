import 'package:flutter/material.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/widgets/icon_text_button.dart';
import 'package:netflix_app/presentation/main_page/widgets/appbar_widget.dart';

import '../../domain/models/coming_soon/coming_soon_movies.dart';
import '../../domain/models/coming_soon/function/http_function_comming_soon.dart';
import 'widgets/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    final Size tsize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: AppbarWidget(
                title: 'New & hot',
              )),
          body: Column(
            children: [
              kheight,
              TabBar(
                  labelColor: kBlackColor,
                  unselectedLabelColor: kwhitecolor,
                  // isScrollable: true,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                      borderRadius: kRadius30, color: kwhitecolor),
                  tabs: const [
                    Tab(
                      text: '🍿 Coming Soon',
                    ),
                    Tab(
                      text: "👀 Everyone's watching",
                    )
                  ]),
              kheight,
              Expanded(
                child: TabBarView(children: [
                  _buildComingSoon(context),
                  _buildEveryonesWatching(tsize),
                ]),
              )
            ],
          )),
    );
  }

  Widget _buildComingSoon(BuildContext context) {
    List<ComingsoonMovies>? cominglist;
    return FutureBuilder(
      future: getallComingsoonmivies(apikey),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          cominglist = snapshot.data;
        }

        return ListView.builder(
          itemBuilder: (context, index) {
            return snapshot.connectionState == ConnectionState.waiting
                ? SizedBox()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            cominglist![index].releaseDate ?? "",
                            style: TextStyle(
                                fontSize: 16,
                                color: kGreyColor,
                                fontWeight: FontWeight.w400),
                          ),
                          // Text(
                          //   "11",
                          //   style: TextStyle(
                          //       fontSize: 30,
                          //       fontWeight: FontWeight.bold,
                          //       letterSpacing: 3),
                          // ),
                        ],
                      ),
                      kwidth,
                      Expanded(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.65,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      child: cominglist?[index].backdropPath !=
                                              null
                                          ? Image.network(
                                              imagepath +
                                                  cominglist![index]
                                                      .backdropPath!,
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
                                kheight,
                                Row(
                                  children: [
                                    const Spacer(),
                                    iconWithText(
                                        tIcon: Icons.notifications,
                                        tText: "Remind Me",
                                        iconsize: 20,
                                        textsize: 12),
                                    kwidth,
                                    iconWithText(
                                        tIcon: Icons.info,
                                        tText: "Info",
                                        iconsize: 20,
                                        textsize: 12),
                                    kwidth,
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Marquee(
                                      child: Text(
                                        cominglist![index].originalTitle ?? '',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      cominglist![index].releaseDate ?? "",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                kheight,
                                Row(
                                  children: [
                                    Image.network(
                                      kLogoimage,
                                      width: 20,
                                      height: 15,
                                    ),
                                    const Text(
                                      "FILM",
                                      style: TextStyle(color: kGreyColor),
                                    ),
                                  ],
                                ),
                                kheight,
                                Marquee(
                                  child: Text(
                                    cominglist![index].originalTitle ?? '',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                kheight,
                                Expanded(
                                  child: Text(
                                    cominglist![index].overView ?? "",
                                    style: TextStyle(
                                        color: kGreyColor, fontSize: 16),
                                  ),
                                )
                              ]),
                        ),
                      ),
                    ],
                  );
          },
          itemCount: 10,
        );
      },
    );
  }
}

Widget _buildEveryonesWatching(Size tsize) {
  return ListView.builder(
    itemBuilder: (context, index) {
      return  EveryonesWatchingWidget(index: index,);
    },
    itemCount: 10,
  );
}
