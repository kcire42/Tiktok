import 'package:flutter/material.dart';

class VideoGradient extends StatelessWidget {
  const VideoGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black
            ]
          ),
        ),
      ),
    );
  }
}