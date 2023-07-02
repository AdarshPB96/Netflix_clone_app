import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> asets = [Colors.green, Colors.grey, Colors.blue, Colors.red];
    return Stack(
      children: [
        Container(
          color: asets[index % asets.length],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Left side
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off,
                      color: kwhitecolor,
                      size: 30,
                    ),
                  )),
            ),
            //Right side
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/1XS1oqL89opfnbLl8WnZY1O1uJx.jpg"),
                  ),
                ),
                VideoActions(icon: Icons.emoji_emotions, title: 'LOL'),
                VideoActions(icon: Icons.add, title: 'My List'),
                VideoActions(icon: Icons.share, title: 'Share'),
                VideoActions(icon: Icons.play_arrow, title: 'Play')
              ],
            )
          ],
        )
      ],
    );
  }
}

class VideoActions extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActions({required this.icon, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: kwhitecolor,
            size: 30,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }
}
