

import 'dart:async';
import 'dart:convert';

import 'package:appwrite/services/account.dart';
import 'package:flutter/material.dart';
import 'package:meme/model/UserData.dart';
import 'package:meme/providers/AppwriteClientProvider.dart';

class AccountsProvider with ChangeNotifier {
  Future<bool> isLoggedIn;
  bool isEmailValidated = false;
  bool isPasswrordValidated = false;
 Future<UserData> isLoggedResponse;
 bool isLoggedInChecked=false;

  getCheckIfLoggedIn() {
    isLoggedIn = checkForLogin();
    isLoggedInChecked =true;
  }

  Future<bool> checkForLogin() async {
    dynamic response;
    try {
      response = await Account(AppWriteClientProvider().client).get();
    }catch(exp)
    {
      print(exp.toString());
      return false;
    }

    print("checkForLogin${response.statusCode}");

    if (response.statusCode >= 400) {
      return false;
    } else if (response.statusCode<=200) {
      print("checkForLogin${response.data}");
      isLoggedResponse = returnUserData(response );
      return true;
    } else {
      return false;
    }
  }


   loginWith(String email,String password) async {
    dynamic response;
    try{ response = await Account(AppWriteClientProvider().client).createSession(email: email, password: password);}
    catch(e){
      print(e);
        _signupWithEmail(email,password);
        return false;

    }
    print(response.statusCode);
   if (response.statusCode>=200) {
      isLoggedResponse = returnUserData(response);
      notifyListeners();
    } else {
      return false;
    }
  }
//     loginWithGoogle() async {
//   // var response = await Account(AppWriteClientProvider().client).createOAuth2Session(provider: "google",);
//    print(response.statusCode);
//    if (response.statusCode == 401) {
//      _signupWithEmail(email,password);
//    } else if (response.statusCode == 200) {
//      isLoggedResponse = response.data;
//      notifyListeners();
//    } else {
//      return false;
//    }
//  }
//



  

  Future<bool> _signupWithEmail(String email,String password)async  {

    dynamic response = await Account(AppWriteClientProvider().client).create(email: email, password: password);
      if(response.statusCode>=400)
        {
         return false;
        }else if(response.statusCode>=200)
          {
            isLoggedResponse = returnUserData(response);
            return true;
          }else
            {
              return false;
            }

  }

  showEmailValidator()
  {
    isEmailValidated = true;
    notifyListeners();
  }
  showPasswordValidator()
  {
    isPasswrordValidated = true;
    notifyListeners();
  }



  Future<UserData> returnUserData(dynamic response) async{
    return UserData.fromJson(jsonDecode(response.toString()));
  }
}
