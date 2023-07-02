import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';

import 'package:netflix_app/presentation/home/widgets/number_card.dart';
import 'package:netflix_app/presentation/home/widgets/page_view_widget.dart';
import 'package:netflix_app/presentation/main_page/widgets/texttitle.dart';
import 'package:netflix_app/presentation/home/widgets/icon_text_button.dart';

ValueNotifier<bool> scrollnotifier = ValueNotifier(true);
// ValueNotifier<List<String>> pageviewlist = ValueNotifier([]);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollnotifier,
      builder: (context, index, _) {
        return SafeArea(
          child: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollnotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollnotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.83,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(kmainImage))),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                iconWithText(
                                    tIcon: Icons.add, tText: "My List"),
                                _playButton(),
                                iconWithText(tIcon: Icons.info, tText: "Info")
                              ]),
                        )
                      ],
                    ),
                    const TextTitle(title: 'Released in the past year'),
                    PageViewWidget(size: size),
                    const TextTitle(title: "Trending Now"),
                    PageViewWidget(size: size),
                    const TextTitle(title: "South Indian Cinema"),
                    PageViewWidget(size: size),
                    const TextTitle(title: "Top 10 Tv Shows In India Today"),
                    const Top10TvShoesWidget(),
                    const TextTitle(title: "Tense Dramas"),
                    PageViewWidget(size: size)
                  ],
                ),
                scrollnotifier.value
                    ? AnimatedContainer(
                        duration: const Duration(microseconds: 1000),
                        width: double.infinity,
                        height: 90,
                        color: Colors.black.withOpacity(0.5),
                        child: Column(children: [
                          Row(
                            children: [
                              Image.network(
                                kLogoimage,
                                width: 60,
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.cast,
                                color: kwhitecolor,
                                size: 30,
                              ),
                              kwidth,
                              Container(
                                width: 30,
                                height: 30,
                                color: Colors.blue,
                              ),
                              kwidth,
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text("TV Shows", style: kHomeTitleText),
                              Text(
                                "Movies",
                                style: kHomeTitleText,
                              ),
                              Text(
                                "categories",
                                style: kHomeTitleText,
                              )
                            ],
                          )
                        ]),
                      )
                    : kheight,
              ],
            ),
          ),
        );
      },
    ));
  }

  TextButton _playButton() {
    return TextButton.icon(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kbuttoncolorWhite)),
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow,
          color: kBlackColor,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            "Play",
            style: TextStyle(fontSize: 22, color: kBlackColor),
          ),
        ));
  }
}
