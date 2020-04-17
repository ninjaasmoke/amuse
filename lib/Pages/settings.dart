import 'package:amuse/Login/loginpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String name = "Name";

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  final myController  = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  savename() {
    setState(() {
      name = myController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Settings"),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_)=> AlertDialog(
                  backgroundColor: Color(0xff202020),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  title: Text("Enter Name", style: TextStyle(color: Colors.white),),
                  content: CupertinoTextField(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal:10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    autocorrect: false,
                    style: TextStyle(color: Colors.black),
                    cursorColor: CupertinoColors.activeGreen,
                    controller: myController,
                    onEditingComplete: savename,
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Save",style: TextStyle(color: Colors.blue),),
                      onPressed: () {
                        setState(() {
                          name = myController.text;
                          Navigator.pop(context);
                        });
                      },
                    ),
                    FlatButton(
                      child: Text("Cancel",style: TextStyle(color: Colors.red),),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )
              );
            },
            icon: Icon(CupertinoIcons.pen, color: Colors.white,),
            label: Text("Edit",style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xff181818),
              borderRadius: BorderRadius.circular(25)),
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Center(
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll) {
                overScroll.disallowGlow();
                return true;
              },
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('Assets/Muse.png'),
                      backgroundColor: Colors.transparent,
                      radius: 60,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(height: 30, color: Colors.white),
                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    Divider(height: 30, color: Colors.white),
//                    Text(
//                      email,
//                      style: TextStyle(
//                          color: Colors.white,
//                          fontSize: 20,
//                          fontWeight: FontWeight.w400),
//                    ),
//                    Divider(height: 30, color: Colors.white),
//                    SizedBox(
//                      height: 350,
//                    )
                  ],
                ),
              ),
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
//      floatingActionButton: FloatingActionButton.extended(
//        onPressed: () async {
//          showDialog(
//              context: context,
//              builder: (_) => CupertinoAlertDialog(
//                    content: Text(
//                      "\nYou will not be able to use aMuse if you sign out",
//                      style: TextStyle(color: CupertinoColors.white),
//                    ),
//                    title: Text(
//                      "Sign Out?",
//                      style: TextStyle(color: CupertinoColors.white, fontSize: 20),
//                    ),
//                    actions: <Widget>[
//                      CupertinoButton(
//                        child: Text(
//                          "Yes",
//                          style: TextStyle(color: CupertinoColors.inactiveGray),
//                        ),
//                        onPressed: () async {
//                          await googleSignIn.signOut().whenComplete(() {
//                            Navigator.pushAndRemoveUntil(
//                                context,
//                                MaterialPageRoute(
//                                    builder: (BuildContext context) =>
//                                        LoginPage()),
//                                ModalRoute.withName('/'));
//                          });
////                          setState(() {
////                            name = null;
////                            email = null;
////                            photoURL = null;
////                          });
//                        },
//                      ),
//                      CupertinoButton(
//                        child: Text("Cancel"),
//                        onPressed: () => Navigator.pop(context),
//                      )
//                    ],
//                  ));
//        },
//        label: Text(
//          "Sign Out",
//          style: TextStyle(
//              color: Colors.black,
//              fontWeight: FontWeight.w500,
//              fontSize: 18,
//              letterSpacing: 0),
//        ),
//        backgroundColor: Colors.grey[100],
//        icon: Icon(
//          CupertinoIcons.profile_circled,
//          color: Colors.black,
//        ),
//      ),
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
