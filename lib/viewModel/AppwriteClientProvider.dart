import 'package:appwrite/client.dart';
import 'package:appwrite/appwrite.dart';

class AppWriteClientProvider {

  Client client;
  AppWriteClientProvider()
  {
    _getClient();
  }



  Client _getClient()
  {

      client= Client();
      client.setEndpoint('http://206.189.138.24/v1') // Your API Endpoint
          .setProject('5f1d20eaa5ed3')//Meme App id
    .setSelfSigned();

      return client;
  }




}