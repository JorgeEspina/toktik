import 'package:flutter/material.dart';
import 'package:toktik/domian/entities/video_post.dart';
import 'package:toktik/domian/repositories/video_post_respositories.dart';
import 'package:toktik/infraestructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier{

  final VideoPostRepository videosRepository;

  bool initialLoading = true;
  List <VideoPost> videos = [];

  DiscoverProvider({
    required this.videosRepository
  }); 

  Future<void> loadNextPage() async {
    //await Future.delayed(const Duration(seconds: 2));
    
    // final List<VideoPost> newVideos = videoPosts.map(
    //   (video) => LocalVideoModel.fromJson(video).toVideoPostEntity()
    // ).toList();
    
    final newVideos = await videosRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}