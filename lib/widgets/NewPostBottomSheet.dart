import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class NewPostBottomSheet extends StatefulWidget{


  @override
  State createState() {
    return NewPostBottomSheetState();
  }
}


class NewPostBottomSheetState extends State<NewPostBottomSheet>
{
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 8,right: 8,top: 12,bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 24),
              child: Text("Create a new Post with"),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(LineAwesomeIcons.image),
                        Text("IMAGE")
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(LineAwesomeIcons.film),
                        Text("VIDEO")
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(LineAwesomeIcons.youtube),
                        Text("Youtube")
                      ],
                    ),
                  ),
                ),
              ),



            ],),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(LineAwesomeIcons.link),
                          Text("Link")
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(LineAwesomeIcons.file_text),
                          Text("Text")
                        ],
                      ),
                    ),
                  ),
                ),
              ],),
            )
          ],
        ),
      ),
    );

  }

}