import 'dart:convert';
import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';
import 'package:meme/model/PostsCollectionResponse.dart';
import 'package:meme/providers/AppwriteClientProvider.dart';

class PostRespViewProvider with ChangeNotifier {
  Future<List<Documents>> postsData;
  List<Documents> _pData;

  getPostsReq() async {
    print("getPostsReq");
    var db = new Database(AppWriteClientProvider().client);
    print("parsing1");
    try {
      Response<dynamic> result =
          await db.listDocuments(collectionId: "5f1db344c2279");
      print(result.statusCode);

      String data = result.toString();

      postsData = _parseData(data);
     // notifyListeners();

      print(result.data.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  getFile() async {
    Response<dynamic> response = await Storage(AppWriteClientProvider().client)
        .getFile(fileId: "5f1da47bd97c7");

    print(response.statusCode);
    print(response.data.toString().length);
  }

  Future<List<Documents>> _parseData(String respData) async {
    var data = PostsCollectionResponse.fromJson(jsonDecode(respData));
    if (_pData == null) {
      _pData = List();
    }
    _pData.addAll(data.documents);
    return _pData;
  }
}
