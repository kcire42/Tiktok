 
import 'package:tiktok/domain/datasources/video_posts_datasource.dart';
import 'package:tiktok/domain/repositories/video_posts_repository.dart';
import 'package:tiktok/domain/entities/video_post.dart';

class VideoPostRepositoryimpl implements VideoPostsRepository {

  final VideoPostsDatasource videoDatasource;

  VideoPostRepositoryimpl({required this.videoDatasource});
  @override
  Future<List<VideoPost>> getFavoriteVideosByPage(int page) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videoDatasource.getTrendingVideosByPage(page);
    
  }
  
}