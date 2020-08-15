import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meme/model/PostsCollectionResponse.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YtPostWidget extends StatefulWidget
{
  Documents documents;

  YtPostWidget(this.documents);

  @override
  State<StatefulWidget> createState() {

    return YtPostWidgetState(documents);
  }




}

class YtPostWidgetState extends State<YtPostWidget>{
  Documents documents;
  YtPostWidgetState(this.documents);
  YoutubePlayerController controller;




  @override
  Widget build(BuildContext context) {

    return
      YoutubePlayer(key:UniqueKey(),controller: controller);
  }

  @override
  void initState() {
    controller = YoutubePlayerController(initialVideoId: YoutubePlayer.convertUrlToId(documents.src),
    flags: YoutubePlayerFlags(controlsVisibleAtStart: true,autoPlay: false,disableDragSeek: true));
    super.initState();
  }



  @override
  void dispose() {
    super.dispose();
    controller.pause();
    controller.dispose();
  }
}