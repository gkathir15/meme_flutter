import 'package:appwrite/client.dart';
import 'package:appwrite/appwrite.dart';

class AppWriteClientProvider {

  Client _client;
  AppWriteClientProvider()
  {
    getClient();
  }



  Client getClient()
  {

      _client= Client();
      _client.setEndpoint('http://67ab34d5efcb.ngrok.io/v1') // Your API Endpoint
          .setProject('5eef31384aa89')//Meme App id
    .setSelfSigned();

      return _client;
  }




}