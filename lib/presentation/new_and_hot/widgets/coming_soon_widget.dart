import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/home/widgets/icon_text_button.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/video_widget.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';

class CommingSoonWidget extends StatelessWidget {
  const CommingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size tsize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: const [
            Text(
              "FEB",
              style: TextStyle(
                  fontSize: 16, color: kGreyColor, fontWeight: FontWeight.w400),
            ),
            Text(
              "11",
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 3),
            ),
          ],
        ),
        kwidth,
        SizedBox(
          width: tsize.width * 0.85,
          height: tsize.height * 0.65,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            VideoWidget(size: tsize),
            kheight,
            Row(
              children: [
                const Text(
                  "TALL GIRL 2",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
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
            const Text(
              "Coming on 04 Apr",
              style:  TextStyle(fontSize: 16),
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
            const Text(
              "TALL GIRL 2",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            kheight,
            const Text(
              "Landing the lead in the school musical is a dream come true for Jodi,until the pressure sends her confidence - and her relationship - into a tailspain ",
              style: TextStyle(color: kGreyColor, fontSize: 16),
            )
          ]),
        ),
      ],
    );
  }
}
