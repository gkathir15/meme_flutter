import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meme/model/PostsCollectionResponse.dart';
import 'package:meme/providers/PostRespViewProvider.dart';
import 'package:meme/widgets/ImagePostWidget.dart';
import 'package:meme/widgets/PostsCard.dart';
import 'package:meme/widgets/VideoCacheProvider.dart';
import 'package:meme/widgets/VideoPostWidget.dart';
import 'package:meme/widgets/YtPostWidedget.dart';
import 'package:provider/provider.dart';

class PostsList extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
        future: Provider.of<PostRespViewProvider>(context,listen: false ).postsData,
        builder: (BuildContext buildContext,
            AsyncSnapshot<List<Documents>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount:snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  if (snapshot.data[index].type == "youtube") {
                    return PostsCard( snapshot.data[index],YtPostWidget(snapshot.data[index]));
                  } else if (snapshot.data[index].type == "image") {
                    return PostsCard( snapshot.data[index],ImagePostWidget(snapshot.data[index]));
                  } else if (snapshot.data[index].type == "video") {
                    return PostsCard( snapshot.data[index],Consumer<VideoCacheProvider>(builder: (context,_,child){
                      return  VideoPostWidget(snapshot.data[index]);
                    },));
                  } else {
                    return Container();
                  }
                });
          } else {
            print(snapshot.connectionState);
            return Center(child: CircularProgressIndicator());
          }
        }
    );
  }
}