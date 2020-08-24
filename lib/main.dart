import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:meme/model/UserData.dart';
import 'package:meme/providers/AccountsProvider.dart';
import 'package:meme/providers/AppwriteClientProvider.dart';
import 'package:meme/providers/PostRespViewProvider.dart';
import 'package:meme/widgets/LoginOrSignup.dart';
import 'package:meme/widgets/NewPostBottomSheet.dart';
import 'package:meme/widgets/PostsList.dart';
import 'package:meme/widgets/VideoCacheProvider.dart';
import 'package:provider/provider.dart';
import 'dart:convert';


void main() {
  runApp(
    MultiProvider(
      child: MyApp(),
      providers: [
        ChangeNotifierProvider<PostRespViewProvider>(
            create: (_) => PostRespViewProvider()),
        ChangeNotifierProvider<AccountsProvider>(
            create: (_) => AccountsProvider()),
        ChangeNotifierProvider<VideoCacheProvider>(create: (_)=>VideoCacheProvider())
      ],
    ),
  );
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
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  bool isReqSent = false;

  @override
  Widget build(BuildContext context) {

    if(Provider.of<AccountsProvider>(context).isLoggedInChecked) {
      return Scaffold(
        extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: Text("Dopamemes"),
            actions: [
              InkWell(child: CircleAvatar(child: Icon(LineAwesomeIcons.user),),onTap: (){

              },)
            ],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(8),right: Radius.circular(8))),
            centerTitle: true,
           
            elevation: 0,
            leading: Icon(LineAwesomeIcons.bars),

          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {

              showModalBottomSheet<void>(context: context,builder: (BuildContext context) {
                return NewPostBottomSheet();
              },);
            },
            child: Icon(Icons.add),
          ),
          backgroundColor: Colors.white,
          body: Container(
            child: FutureBuilder(r
              future: Provider
                  .of<AccountsProvider>(context)
                  .isLoggedResponse,
              builder: (BuildContext context,
                  AsyncSnapshot<UserData> snapshot) {
                if (snapshot.data != null) {
                  return PostsList();
                } else {
                  return LoginOrSignup();
                }
              },
            ),
          ));
    }
    else{

      return Scaffold(
       body : Container(
    child: Center(
    child: Text(
    "Dopamemes",
    style: GoogleFonts.aclonica(color: Colors.white),
    textScaleFactor:5,
    ),
    ),
    color: Colors.black,
    ),
      );

    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("didChangeDep");
    if (!isReqSent) {
      isReqSent = true;
      Provider.of<AccountsProvider>(context).getCheckIfLoggedIn();
      Provider.of<PostRespViewProvider>(context).getPostsReq();
    }
  }

  Future<void> getFile()
  async {
    String response =  new Storage(AppWriteClientProvider().client).getFileView(fileId: "5f342a1b06775");
    print(response);
  }
}
