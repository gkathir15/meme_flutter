import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meme/model/PostsCollectionResponse.dart';
import 'package:video_player/video_player.dart';

class VideoPostWidget extends StatefulWidget
{
  Documents documents;

  VideoPostWidget(this.documents);

  @override
  State<StatefulWidget> createState() {

    throw VideoPostWidgetState(documents);
  }




}

class VideoPostWidgetState extends State<VideoPostWidget>{
  Documents documents;
  VideoPostWidgetState(this.documents);
  VideoPlayerController controller;




  @override
  Widget build(BuildContext context) {

    return Card(child: Column(children: <Widget>[
      VideoPlayer(controller)
    ],));
  }

  @override
  void initState() {
    controller = VideoPlayerController.network(documents.src);
    super.initState();
  }

  @override
  bool get mounted {
   controller.play();
  }

  @override
  void dispose() {
    super.dispose();
    controller.pause();
    controller.dispose();
  }
}