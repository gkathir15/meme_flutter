import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meme/model/PostsCollectionResponse.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YtPostWidget extends StatelessWidget
{
  Documents documents;

  YtPostWidget(this.documents,this.controller);

  YoutubePlayerController controller;




  @override
  Widget build(BuildContext context) {

    controller.load(documents.src);

    return
      YoutubePlayer(controller: controller);
  }




}

