import 'package:appwrite/appwrite.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meme/model/PostsCollectionResponse.dart';
import 'package:meme/providers/AppwriteClientProvider.dart';
import 'package:video_player/video_player.dart';

class VideoPostWidget extends StatefulWidget
{
  Documents _documents;

  VideoPostWidget(this._documents);

  @override
  State<StatefulWidget> createState() {

    return  VideoPostWidgetState(_documents);
  }




}

class VideoPostWidgetState extends State<VideoPostWidget>{
  Documents _documents;
  VideoPostWidgetState(this._documents);
  VideoPlayerController _controller;




  @override
  Widget build(BuildContext context) {

    return  AspectRatio(key: UniqueKey(),
        aspectRatio: _controller.value.aspectRatio,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            VideoPlayer(_controller),
            _PlayPauseOverlay(controller: _controller),
          ],
        ));

  }

  @override
  void initState() {

    super.initState();
    _controller = VideoPlayerController.network(new Storage(AppWriteClientProvider().client).getFileView(fileId:_documents.src));

    _controller.addListener(() {

    });
    _controller.setLooping(true);
    _controller.initialize();
  }



  @override
  void dispose() {
    super.dispose();
    _controller.pause();
    _controller.dispose();
  }
}


class _PlayPauseOverlay extends StatelessWidget {
  const _PlayPauseOverlay({Key key, this.controller}) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
            color: Colors.black26,
            child: Center(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 60.0,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
      ],
    );
  }
}