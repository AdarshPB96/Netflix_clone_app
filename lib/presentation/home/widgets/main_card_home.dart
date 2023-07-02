import 'package:flutter/material.dart';

class MaincardHome extends StatelessWidget {
  const MaincardHome({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const imageurl =
        "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg";
    return Container(
      height: size.height,
      width: size.width * 0.3,
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: NetworkImage(imageurl), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(7)),
    );
  }
}
