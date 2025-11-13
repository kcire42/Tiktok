import 'package:flutter/material.dart';
import 'package:tiktok/domain/entities/video_post.dart';
import 'package:tiktok/infrastructure/repositories/video_repositories_impl.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepositoryimpl videoRepository;
  bool initialLoading = true;
  List <VideoPost> videos = [];
  DiscoverProvider({required this.videoRepository}); 
  

  Future<void> loadNextPage() async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   final List<VideoPost> newVideos = videoPosts.map(
  //     (video) => LocalVideoModel.fromJson(video).toVideoPostEntity()
  //   ).toList();
    final newVideos = await videoRepository.getTrendingVideosByPage(1);
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}