import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:meme/providers/CacheProvider.dart';
import 'package:provider/provider.dart';

class VideoCacheProvider with ChangeNotifier
{

  Future<File> cachedPath;

  Future<File> getFile()
  {
      return cachedPath;
  }

  Future<void> getCachedVideo(String fullPath)
  async {
    print("download video $fullPath");
   cachedPath=CacheProvider().getSingleFile(fullPath);

  }

}