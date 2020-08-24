import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meme/model/PostsCollectionResponse.dart';
import 'package:meme/providers/AppwriteClientProvider.dart';
import 'package:meme/providers/VideoPlayerProvider.dart';
import 'package:meme/widgets/VideoCacheProvider.dart';
import 'package:provider/provider.dart';
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

    return
     FutureBuilder(
        future:  Provider.of<VideoCacheProvider>(context).getFile(),
        builder:(BuildContext context,
            AsyncSnapshot<File> snapshot) {
          if(snapshot.hasData)
            {
              _controller = VideoPlayerController.file(snapshot.data);
              _controller.setLooping(true);
              _controller.initialize();
              _controller.play();
              print("file ${snapshot.data.path}");
              return AspectRatio(key: UniqueKey(),
                  aspectRatio: _controller.value.aspectRatio,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      VideoPlayer(_controller),
                      _PlayPauseOverlay(controller: _controller),
                    ],
                  ));
            }else{
            return SizedBox(child: Center(child: CircularProgressIndicator(),),height: 400,width: MediaQuery.of(context).size.width);
          }
        },

    );

  }

  @override
  void initState() {

    super.initState();

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<VideoCacheProvider>(context).getCachedVideo(new Storage(AppWriteClientProvider().client).getFileView(fileId:_documents.src));

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
    return ChangeNotifierProvider(
      create: (_) => VideoPlayerProvider(),
    child: Consumer<VideoPlayerProvider>(
    builder: (_, model, __) { return Stack(
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
      );}
    ));
  }
}

class _MuteUnmute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return InkWell(child: Icon(Provider.of<VideoPlayerProvider>(context).isMute?Icons.volume_off:Icons.volume_up),onTap:(){ Provider.of<VideoPlayerProvider>(context).muteUnMute();});
  }

}