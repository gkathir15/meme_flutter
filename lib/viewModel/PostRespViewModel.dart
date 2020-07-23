import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';
import 'package:meme/model/PostsCollectionResponse.dart';
import 'package:meme/viewModel/AppwriteClientProvider.dart';
import 'package:provider/provider.dart';

class PostRespViewProvider with ChangeNotifier
{
  Future<List<Documents>> postsData;
  List<Documents> _pData;





   getPostsReq() async
   {
     print("getPostsReq");
     var db = new Database(AppWriteClientProvider().getClient());
     print("parsing1");
     Future resp = db.listDocuments(collectionId: "5ef855cdb3617");
     resp.then((value) =>() {
         postsData= compute(parseData,value.toString());
         print(value.toString());
   notifyListeners();
     }).catchError((onError){
       print(onError);
     });
   }




 List<Documents> parseData(String respData)
  {
    var data = PostsCollectionResponse.fromJson(jsonDecode(respData));
    _pData.addAll(data.documents);
    return _pData;
  }
}