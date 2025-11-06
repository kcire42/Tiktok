import 'package:flutter/material.dart';
import 'package:tiktok/presentation/widgets/video/video_gradient.dart';
import 'package:video_player/video_player.dart';

class FullscreenPlayer extends StatefulWidget { // standard stateless widget using stl
  final String videoUrl;
  final String name;
  
  const FullscreenPlayer({
    super.key,
    required this.videoUrl,
    required this.name
  });

  @override
  State<FullscreenPlayer> createState() => _FullscreenPlayerState();
}

class _FullscreenPlayerState extends State<FullscreenPlayer> {
  late VideoPlayerController controller;
  late Future<void> initializeVideoPlayerFuture;

  
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(widget.videoUrl);
    initializeVideoPlayerFuture = controller.initialize().then((_) {
      controller.setLooping(true);
      controller.setVolume(1.0); // 0 = silencio
      controller.play();
      setState(() {});
    });
      

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return FutureBuilder(
      future: initializeVideoPlayerFuture,
      builder: (context, snapshot){
        if (snapshot.connectionState != ConnectionState.done){
      return const Center(child: CircularProgressIndicator(strokeWidth: 2, color: Colors.red));
      }
      return GestureDetector(
        onTap: () {
          if (controller.value.isPlaying) {
            controller.pause();
          } else {
            controller.play();
          }
        },
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: Stack(
            children: [
              VideoPlayer(controller),
              VideoGradient(),
              Positioned(
                bottom: 50,
                left: 20,
                child: _VideoCaption(name: widget.name))
            ],
          ),
        ),
      );
    });
  }



}



class _VideoCaption extends StatelessWidget {

  final String name;

  const _VideoCaption({required this.name});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: size.width * 0.7,
      child: Text(
        name,
        maxLines: 2,
        style: titleStyle,
        ),
    );
  }
}