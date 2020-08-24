import 'package:flutter/cupertino.dart';

class VideoPlayerProvider with ChangeNotifier{

  var isMute=false;
  var isPlaying=false;

  void setPlay()
  {
    isPlaying = !isPlaying;
    notifyListeners();
  }void muteUnMute()
  {
    isMute = !isMute;
    notifyListeners();
  }
}