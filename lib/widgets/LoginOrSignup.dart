import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meme/providers/AccountsProvider.dart';
import 'package:meme/utils.dart';
import 'package:provider/provider.dart';

class LoginOrSignup extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {

   return LoginPageState();
  }




}
class LoginPageState extends State<LoginOrSignup>
{

  TextEditingController _emailController;
  TextEditingController _userNameController;
  TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();



  }

  @override
  Widget build(BuildContext context) {
    return
     Container(

        child: Card(
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("Welcome",style:  GoogleFonts.nunito(),textScaleFactor: 3,),
            ),
           Container(child: Card(
                child: Column(
                  children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(controller: _emailController, decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email Id',
                      errorText: Provider.of<AccountsProvider>(context).isPasswrordValidated ?"enter proper Email"
                          : null,
                    )),
                  ),Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        obscureText: true,
                          controller: _passwordController, decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                        errorText: Provider.of<AccountsProvider>(context).isPasswrordValidated ?"enter proper password"
                          : null,

                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      elevation: 8,
                      animationDuration: Duration(seconds: 1),
                      onPressed: (){
                      if(_emailController.text.isNotEmpty)
                      {
                        if(_passwordController.text.length>5)
                          {
                            Provider.of<AccountsProvider>(context,listen: false).loginWith(_emailController.text, _passwordController.text);
                          }else{
                          Provider.of<AccountsProvider>(context,listen: false).showPasswordValidator();
                        }

                      }else{
                        Provider.of<AccountsProvider>(context,listen: false).showEmailValidator();
                      }
                    },child: Text("Signup"
                        ""
                        ""),),
                  ),Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SignInButton(Buttons.Google,onPressed: (){


                      },),
                  )],
                ),
              ),)



          ],),
        )
    );

  }

  @override
  void dispose() {
    _emailController.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}