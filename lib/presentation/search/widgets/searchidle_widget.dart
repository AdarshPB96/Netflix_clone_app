import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/main_page/widgets/texttitle.dart';

const imageurl =
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg";

class SearchidleWidget extends StatelessWidget {
  const SearchidleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextTitle(title: "top Searches"),
        kheight,
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return const TopSearchItemTile();
              },
              separatorBuilder: (context, index) => kheight20,
              itemCount: 10),
        )
      ],
    );
  }
}



class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenwidth * 0.35,
          height: 65,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageurl))),
        ),
        kwidth,
        const Expanded(
          child: Text(
            'Movie Name  ',
            style: TextStyle(
                color: kwhitecolor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.play_circle_outline,
              color: kwhitecolor,
              size: 40,
            ))
      ],
    );
  }
}
