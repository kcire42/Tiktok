import 'package:flutter/material.dart';
import 'package:tiktok/config/helpers/human_format.dart';
import 'package:tiktok/domain/entities/video_post.dart';

class VideoButtons extends StatefulWidget {

  final VideoPost video;
  final int likes;

  const VideoButtons({
    super.key,
    required this.video,
    required this.likes,
  });

  @override
  State<VideoButtons> createState() => _VideoButtonsState();
}

class _VideoButtonsState extends State<VideoButtons> {
  
  Color color = Colors.white;
  late int likesCount;

  @override
  void initState() {
    super.initState();
    likesCount = widget.likes;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: (){
          setState(() {
            color = (color == Colors.red) ? Colors.white : Colors.red;
            likesCount += (color == Colors.red) ? 1 : -1;
          });

        }, icon: Icon(Icons.favorite, color: color,size: 45,)),
        const SizedBox(height: 5,),
        Text('${HumanFormat.humanReadableNumber(likesCount.toDouble())}', style: const TextStyle(color: Colors.white, fontSize: 16),)
      ]
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final int? likes;
  final Color color;

  const CustomIconButton({
    super.key,
    required this.icon,
    this.likes,
    required this.color
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        IconButton(onPressed: () {},icon: Icon(icon, color: color, size: 45,)),
        const SizedBox(height: 5,),
        Text('${HumanFormat.humanReadableNumber(likes?.toDouble() ?? -1)}', style: const TextStyle(color: Colors.white, fontSize: 16),)
      ],
    );
  }
}