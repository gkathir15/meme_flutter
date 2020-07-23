import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/services/database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meme/model/PostsCollectionResponse.dart';
import 'package:meme/viewModel/AppwriteClientProvider.dart';
import 'package:meme/viewModel/PostRespViewModel.dart';
import 'package:meme/widgets/ImagePostWidget.dart';
import 'package:meme/widgets/VideoPostWidget.dart';
import 'package:meme/widgets/YtPostWidedget.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}
//  runApp(ChangeNotifierProvider<PostRespViewProvider>(
//   create:(context) =>PostRespViewProvider(),
//      child: MyApp()));


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meme",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: FloatingActionButton(onPressed: () {
      getPostsReq();
    }, child: Icon(Icons.refresh),),
        backgroundColor: Colors.white,
        body: Container(child: FutureBuilder(
            future: postsData,
            builder: (BuildContext buildContext,
                AsyncSnapshot<List<Documents>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount:snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (snapshot.data[index].type == "youtube") {
                        return YtPostWidget(snapshot.data[index]);
                      } else if (snapshot.data[index].type == "image") {
                        return ImagePostWidget(snapshot.data[index]);
                      } else if (snapshot.data[index].type == "video") {
                        return VideoPostWidget(snapshot.data[index]);
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
    _pData = List();
  }

  Future<List<Documents>> postsData;
  List<Documents> _pData;


  getPostsReq() async
  {
    var _client = new Client();
    _client.setEndpoint('https://67ab34d5efcb.ngrok.io/v1') // Your API Endpoint
        .setProject('5eef31384aa89') //Loaded Weights App id
        .setSelfSigned();
    print("getPostsReq");
    var db = new Database(_client);
    print("parsing1");
    try {
      Response<dynamic> result= await db.listDocuments(collectionId: "5ef855cdb3617");
      print(result.statusCode);

      String data = result.toString();


      setState(() {
        postsData= parseData(data);
      });
      print(result.data.toString());



  }catch(e)
  {
  print(e.toString());
  }



  }

  Future<List<Documents>> parseData(String respData) async {
    var data = PostsCollectionResponse.fromJson(jsonDecode(respData));
    _pData.addAll(data.documents);
    return _pData;
  }
}
