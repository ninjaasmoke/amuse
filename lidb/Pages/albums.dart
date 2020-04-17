import 'dart:math';
import 'package:amuse/Animations/showup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:amuse/Utils/createalbum.dart';

class RandomColorAlbum {
  static Random random = Random();
  static Color myColor() {
    return Color.fromARGB(
        100, random.nextInt(1), random.nextInt(150), random.nextInt(200));
  }
}

class Albums extends StatefulWidget {
  @override
  _AlbumsState createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {
  int time = 100;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, RandomColorAlbum.myColor()],
              begin: FractionalOffset(0.2, 0.25),
              end: FractionalOffset(0.01, 0.015),
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              title: Text("Albums"),
              elevation: 0,
              automaticallyImplyLeading: false,
            ),
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll) {
                overScroll.disallowGlow();
                return true;
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff202020).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(25)),
                  height: MediaQuery.of(context).size.height * .87,
                  child: Center(
                      child: GridView.count(
                        crossAxisCount: 2,
                        primary: false,
                        padding: EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: <Widget>[
                          ShowUp(
                            delay: time * 2,
                            child: CreateAlbum(
                              text: 'Album 1',
                              color: Colors.red[100],
                            ),
                          ),
                          ShowUp(
                            delay: time * 3,
                            child: CreateAlbum(
                              text: 'Album 2',
                              color: Colors.blue[100],
                            ),
                          ),
                          ShowUp(
                            delay: time * 4,
                            child: CreateAlbum(
                              text: 'Album 3',
                              color: Colors.amber[200],
                            ),
                          ),
                          ShowUp(
                            delay: time * 5,
                            child: CreateAlbum(
                              text: 'Album 4',
                              color: Colors.grey[300],
                            ),
                          )
                        ],
                      )
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () async {
                Navigator.pop(context);
              },
              label: Text(
                "Home",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    letterSpacing: 0),
              ),
              backgroundColor: Colors.grey[100],
              icon: Icon(
                CupertinoIcons.home,
                color: Colors.black,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          ),
        )
      ],
    );
  }
}
