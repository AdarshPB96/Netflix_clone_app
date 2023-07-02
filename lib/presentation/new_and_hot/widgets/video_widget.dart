import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';

import '../../../core/constants.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
    required this.size,
     this.imageHeight=0.3
  });

  final Size size;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: size.height * imageHeight,
          child: Image.network(
            kNewandHotImage,
            fit: BoxFit.cover,
          ),
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
    );
  }
}
