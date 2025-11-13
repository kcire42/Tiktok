import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/domain/entities/video_post.dart';
import 'package:tiktok/presentation/widgets/shared/video_buttons.dart';
import 'package:tiktok/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({
    super.key,
    required this.videos
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final videoPost = videos[index];
        return Stack(
          children:[
            SizedBox.expand(
              child: FullscreenPlayer(videoUrl: videoPost.videoUrl, name: videoPost.name),
            ),
            Align (
              alignment: Alignment.bottomRight,
              child: Padding(padding: const EdgeInsets.only(bottom: 80, right: 10),
              child: Column(mainAxisSize: MainAxisSize.min,
                children: [
                  SpinPerfect(
                    infinite: true,
                    child: CustomIconButton(icon: Icons.adjust, color: Colors.white)),
                  const SizedBox(height: 20,),
                  VideoButtons(video: videoPost, likes: videoPost.likes),
                  const SizedBox(height: 20,),
                  CustomIconButton(icon: Icons.comment, likes: 100, color: Colors.white),
                  const SizedBox(height: 20,),
                  CustomIconButton(icon: Icons.share, color: Colors.white),
                ],
              ),
              ),
            )
            
          ]
        );

      }
    );
  }
}