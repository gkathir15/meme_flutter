import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meme/model/PostsCollectionResponse.dart';

class ImagePostWidget extends StatelessWidget{
  Documents documents;
  ImagePostWidget(this.documents);




  @override
  Widget build(BuildContext context) {

    return
      CachedNetworkImage(imageUrl: documents.src);
  }
}