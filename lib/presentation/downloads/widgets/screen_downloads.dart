import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/main_page/widgets/appbar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    final imagelist = [
      "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/vppo7eOOkkjoSoBSglYIxLDB0dJ.jpg",
      "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/ym1dxyOk4jFcSl4Q2zmRrA5BEEN.jpg",
      "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/qcNDxDzd5OW9wE3c8nWxCBQoBrM.jpg"
    ];
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppbarWidget(
            title: 'Downloads',
          )),
      body: ListView(
        children: [
          kheight,
          Row(children: const [
            kwidth,
            Icon(
              Icons.settings,
              color: kwhitecolor,
            ),
            kwidth,
            Text(
              'Smart Downloads',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            )
          ]),
          kheight,
          const Text(
            'Introducing Downloads for you',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: kwhitecolor, fontSize: 25, fontWeight: FontWeight.w700),
          ),
          kheight,
          const Text(
            'We will download a personalised selection of movies and shows for you, so there is always something to watch on  your device',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: size.width,
            height: size.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.5),
                  radius: size.width * 0.35,
                ),
                DownloadsimageWidget(
                    imagelist: imagelist[0],
                    margin: const EdgeInsets.only(left: 155, bottom: 35),
                    angle: 21,
                    size: Size(size.width * 0.48, size.width * 0.58)),
                DownloadsimageWidget(
                    imagelist: imagelist[1],
                    margin: const EdgeInsets.only(right: 140, bottom: 30),
                    angle: -20,
                    size: Size(size.width * 0.48, size.width * 0.58)),
                DownloadsimageWidget(
                    imagelist: imagelist[2],
                    margin: const EdgeInsets.only(left: 20),
                    size: Size(size.width * 0.56, size.width * 0.58))
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: size.width * 0.95,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kbuttoncolorBlue),
              child: MaterialButton(
                onPressed: () {},
                child: const Text(
                  'Setup',
                  style: TextStyle(
                      color: kwhitecolor,
                      fontSize: 23,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          kheight,
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 50,
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kbuttoncolorWhite),
              child: MaterialButton(
                onPressed: () {},
                child: const Text(
                  'See what you can download',
                  style: TextStyle(
                    color: kBlackColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DownloadsimageWidget extends StatelessWidget {
  const DownloadsimageWidget(
      {super.key,
      required this.imagelist,
      this.angle = 0,
      required this.margin,
      required this.size});

  final String imagelist;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage(
            imagelist,
          )),
        ),
      ),
    );
  }
}
