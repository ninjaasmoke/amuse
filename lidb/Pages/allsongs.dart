import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home.dart';

class RandomColorSongs {
  static Random random = Random();
  static Color myColor() {
    return Color.fromARGB(
        120, random.nextInt(150), random.nextInt(50), random.nextInt(100));
  }
}

class AllMusic extends StatefulWidget {
  @override
  _AllMusicState createState() => _AllMusicState();
}

class _AllMusicState extends State<AllMusic> {
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
              colors: [Colors.black, RandomColorSongs.myColor()],
              begin: FractionalOffset(0.2, 0.25),
              end: FractionalOffset(0.01, 0.015),
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              title: Text("Songs"),
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
                      child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {

                          },
                          child: Container(
                            height: 40,
                            child: Text(
                              "Song 1",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          child: Text(
                            "Song 2",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        Container(
                          height: 40,
                          child: Text(
                            "Song 3",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                                context,
                                CupertinoPageRoute(
                                    builder: (BuildContext context) =>
                                        Home()),
                                ModalRoute.withName('/'));
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

