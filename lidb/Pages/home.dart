import 'dart:math';
import 'package:amuse/Pages/albums.dart';
import 'package:amuse/Pages/searchscreen.dart';
import 'package:amuse/Pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:amuse/Animations/showup.dart';
import 'package:amuse/Utils/createRow.dart';
import 'package:amuse/Pages/allsongs.dart';
import 'package:amuse/Utils/nowplaying.dart';

String currSongName = 'Current Song Name';
String currAlbum = 'Current Album Name';

class RandomColorHome {
  static Random random = Random();
  static Color myColor() {
    return Color.fromARGB(
        50, random.nextInt(100), random.nextInt(10), random.nextInt(200));
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final int time = 200;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        color: Colors.black,
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, RandomColorHome.myColor()],
            begin: FractionalOffset(0.18, 0.3),
            end: FractionalOffset(0.01, 0.015),
          ),
        ),
        child: Scaffold(
          extendBodyBehindAppBar: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              "Home",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 0),
                  decoration: BoxDecoration(
                      color: Color(0xff181818).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(25)),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(0, 1, 0, 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        ShowUp(
                            delay: time,
                            child: createRow(
                              color: Colors.red[600],
                              text: "Welcome to aMuse",
                              width: MediaQuery.of(context).size.width * .92,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        ShowUp(
                          delay: time * 2,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (BuildContext context) => Search(),
                                      fullscreenDialog: true));
                            },
                            child: createRow(
                              text: 'Search',
                              color: Colors.teal,
                              width: MediaQuery.of(context).size.width * .5,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ShowUp(
                          delay: time * 3,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (BuildContext context) => AllMusic(),
                                      fullscreenDialog: true));
                            },
                            child: createRow(
                              width: (MediaQuery.of(context).size.width) * .72,
                              color: Colors.deepPurple[600],
                              text: 'All Songs',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ShowUp(
                            delay: time * 4,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (BuildContext context) => Albums(),
                                        fullscreenDialog: true));
                              },
                              child: createRow(
                                color: Colors.green[600],
                                text: "Albums",
                                width: MediaQuery.of(context).size.width * .82,
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        ShowUp(
                            delay: time * 5,
                            child: createRow(
                              color: Colors.pink[600],
                              text: "Favourites",
                              width: MediaQuery.of(context).size.width * .62,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (BuildContext context) => Settings(),
                                    fullscreenDialog: true));
                          },
                          child: ShowUp(
                            delay: time * 6,
                            child: createRow(
                              color: Colors.blueGrey,
                              text: 'Settings',
                              width: MediaQuery.of(context).size.width * .9,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.04,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (BuildContext context) => NowPlay(),
                            fullscreenDialog: true));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff202020).withOpacity(0.4), RandomColorSongs.myColor()],
                          end: FractionalOffset(0.2, 0.65),
                          begin: FractionalOffset(0.1, 0.15),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    height: MediaQuery.of(context).size.height*.3,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Text(currSongName,
                        style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.w400,decoration: TextDecoration.none),),
                        SizedBox(height: 20),
                        Text(currAlbum,
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300, color: Colors.grey[300],decoration: TextDecoration.none),),
                        SizedBox(height: MediaQuery.of(context).size.height*.08,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Hero(
                              tag: 'dash',
                              child: FlatButton(
                                onPressed: () {},
                                child: Icon(Icons.play_arrow, size: 60,color: Colors.white,),
                              ),
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Icon(Icons.fast_forward,size: 60, color: Colors.white.withOpacity(0.4),),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
