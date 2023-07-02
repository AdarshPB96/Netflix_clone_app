 import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

Column iconWithText({required IconData tIcon, required String tText,double iconsize=30, double textsize=20}) {
    return Column(
      children: [
        Icon(
          tIcon,
          color: kwhitecolor,
          size: iconsize,
        ),
        Text(
          tText,
          style:  TextStyle(color: kwhitecolor, fontSize: textsize),
        )
      ],
    );
  }