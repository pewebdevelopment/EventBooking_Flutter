import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class LikeButtonScreen extends StatefulWidget {
  const LikeButtonScreen({Key? key}) : super(key: key);

  @override
  State<LikeButtonScreen> createState() => _LikeButtonScreenState();
}

class _LikeButtonScreenState extends State<LikeButtonScreen> {
bool isLiked=false;
int likecount=17;
  @override
  Widget build(BuildContext context) {
    final double size=40;
    return  LikeButton(
      size: size,
      circleColor:
      const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
      bubblesColor: BubblesColor(
        dotPrimaryColor: Color(0xff33b5e5),
        dotSecondaryColor: Color(0xff0099cc),
      ),
      likeBuilder: (bool isLiked) {

        return Icon(
          Icons.favorite_outline,
          color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
          size: size,
        );
      },
      likeCount: likecount,
      countBuilder: ( count,  isLiked,  text) {
        var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
        Widget result;
        if (count == 0) {
          result = Text(
            "love",
            style: TextStyle(color: color),
          );
        } else
          result = Text(
            text,
            style: TextStyle(color: color),
          );
        return result;
      },
    );
  }
}
