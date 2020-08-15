import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:meme/model/PostsCollectionResponse.dart';
import 'package:timeago/timeago.dart' as timeAgo;

class PostsCard extends StatefulWidget {
  Documents _document;
  Widget _widget;

  PostsCard(this._document, this._widget);

  @override
  State<StatefulWidget> createState() {
    return PostsCardState(_document, _widget);
  }
}

class PostsCardState extends State<PostsCard> {
  Documents _document;
  Widget _widget;

  var cardRadius =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0));

  PostsCardState(this._document, this._widget);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6, top: 3),
      child: InkWell(
        child: Card(
          shadowColor: Theme.of(context).cardTheme.shadowColor,
          elevation: 12,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _widget,
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                child: Text(
                  _document.caption,
                  style: GoogleFonts.nunito(),
                  textScaleFactor: 1.2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                child: Text(
                  timeAgo.format(
                      DateTime.fromMillisecondsSinceEpoch(_document.timestamp)),
                  style: GoogleFonts.nunito(),
                  textScaleFactor: 0.8,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      child: Card(
                        elevation: 2,
                        shape: cardRadius,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: Icon(LineAwesomeIcons.rocket),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 36),
                              child: Text(_document.upvote.toString()),
                            ),
                          ],
                        ),
                      ),
                      splashColor: Colors.orange,
                      splashFactory: InkRipple.splashFactory,
                    ),
                    InkWell(
                      child: Card(
                        elevation: 2,
                        shape: cardRadius,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: Icon(LineAwesomeIcons.comment),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 36),
                              child: Text(_document.upvote.toString()),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      child: Card(
                        elevation: 2,
                        shape: cardRadius,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Icon(LineAwesomeIcons.bullhorn),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
