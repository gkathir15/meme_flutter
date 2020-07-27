import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/services/database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meme/model/PostsCollectionResponse.dart';
import 'package:meme/viewModel/AppwriteClientProvider.dart';
import 'package:meme/viewModel/PostRespViewModel.dart';
import 'package:meme/widgets/ImagePostWidget.dart';
import 'package:meme/widgets/PostsCard.dart';
import 'package:meme/widgets/VideoPostWidget.dart';
import 'package:meme/widgets/YtPostWidedget.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(ChangeNotifierProvider<PostRespViewProvider>(
   create:(context) =>PostRespViewProvider(),
      child: MyApp()));

}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meme",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark(),
      home:  MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);


  @override
  _MyHomePageState createState(){
    return _MyHomePageState();}
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: FloatingActionButton(onPressed: () {
      Provider.of<PostRespViewProvider>(context,listen: false).getFile();
    }, child: Icon(Icons.add),),
        backgroundColor: Colors.white,
        body: Container(child: FutureBuilder(
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
                        return PostsCard( snapshot.data[index],VideoPostWidget(snapshot.data[index]));
                      } else {
                        return Container();
                      }
                    });
              } else {
                print(snapshot.connectionState);
                return Center(child: CircularProgressIndicator());
              }
            }
        ),)
    );
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  void didChangeDependencies() {
    print("didChangeDep");
    Provider.of<PostRespViewProvider>(context).getPostsReq();
  }
}
