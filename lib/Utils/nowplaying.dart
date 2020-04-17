import 'package:flutter/material.dart';
import 'package:amuse/Pages/home.dart';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:amuse/Animations/showup.dart';

class RandomColorPlay {
  static Random random = Random();
  static Color myColor() {
    return Color.fromARGB(
        200, random.nextInt(100), random.nextInt(10), random.nextInt(200));
  }
}


class NowPlay extends StatefulWidget {
  @override
  _NowPlayState createState() => _NowPlayState();
}

class _NowPlayState extends State<NowPlay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(10,0,10,10),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30,),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.black, RandomColorPlay.myColor()],
                          end: FractionalOffset(0.2, 0.65),
                          begin: FractionalOffset(0.1, 0.15),
                        ),
                        borderRadius: BorderRadius.circular(25)),
                    height: MediaQuery.of(context).size.height*.93,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Material(
                          color: Colors.transparent,
                          child: Text(currSongName,
                            style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.w400,decoration: TextDecoration.none),),
                        ),
                        SizedBox(height: 20),
                        Material(
                          color: Colors.transparent,
                          child: Text(currAlbum,
                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300, color: Colors.grey[300],decoration: TextDecoration.none),),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*.5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            FlatButton(
                              onPressed: () {},
                              child: Icon(Icons.fast_rewind,size: 50, color: Colors.white.withOpacity(0.4)),
                            ),
                            Hero(
                              tag: 'dash',
                              child: FlatButton(
                                onPressed: () {},
                                child: Icon(Icons.play_arrow, size: 60,color: Colors.white,),
                              ),
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Icon(Icons.fast_forward,size: 50, color: Colors.white.withOpacity(0.4),),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ShowUp(
        delay: 500,
        child: FloatingActionButton.extended(
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
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
    );
  }
}
