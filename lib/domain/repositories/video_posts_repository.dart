import 'package:tiktok/domain/entities/video_post.dart';

abstract class VideoPostsRepository {

  Future<List<VideoPost>> getFavoriteVideosByPage(int page);

  Future<List<VideoPost>> getTrendingVideosByPage(int page);


}