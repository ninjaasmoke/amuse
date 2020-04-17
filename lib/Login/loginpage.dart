//import 'dart:io';
//import 'dart:math';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:amuse/Animations/showup.dart';
//import 'package:amuse/Pages/home.dart';
//
//String name;
//String name1;
//String email;
//String photoURL;
//
////class FBApi {
//
//void logOut() async {
//  await googleSignIn.signOut();
//}
//
//final FirebaseAuth _auth = FirebaseAuth.instance;
//final GoogleSignIn googleSignIn = GoogleSignIn();
//
//class RandomColor {
//  static Random random = Random();
//  static Color myColor() {
//    return Color.fromARGB(
//        200, random.nextInt(150), random.nextInt(150), random.nextInt(150));
//  }
//}
//
//class LoginPage extends StatefulWidget {
//  @override
//  _LoginPageState createState() => _LoginPageState();
//}
//
//class _LoginPageState extends State<LoginPage> {
//  int time = 500;
//
//  Future<FirebaseUser> signInWithGoogle() async {
//    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
//    final GoogleSignInAuthentication googleAuth =
//        await googleUser.authentication;
//
//    final AuthCredential credential = GoogleAuthProvider.getCredential(
//      accessToken: googleAuth.accessToken,
//      idToken: googleAuth.idToken,
//    );
//
//    FirebaseUser userDetails =
//        (await _auth.signInWithCredential(credential)).user;
//
//    name = userDetails.displayName;
//    email = userDetails.email;
//    photoURL = userDetails.photoUrl;
//
//    final FirebaseUser currentUser = await _auth.currentUser();
//    name1 = currentUser.displayName;
//
//    Navigator.pushReplacement(
//        context,
//        CupertinoPageRoute(
//            builder: (BuildContext context) => Home(), fullscreenDialog: true));
//
//    return userDetails;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      height: MediaQuery.of(context).size.height,
//      width: MediaQuery.of(context).size.width,
//      decoration: BoxDecoration(
//        gradient: LinearGradient(
//          colors: [CupertinoColors.black, RandomColor.myColor()],
//          begin: FractionalOffset(0.15, 0.23),
//          end: FractionalOffset(0.01, 0.015),
//        ),
//      ),
//      child: Scaffold(
//        backgroundColor: Colors.transparent,
//        appBar: AppBar(
//          title: ShowUp(
//            child: Text(
//              "Login",
//              style: TextStyle(color: Colors.white),
//            ),
//            delay: 500,
//          ),
//          centerTitle: true,
//          backgroundColor: Colors.transparent,
//          elevation: 0,
//        ),
//        body: SingleChildScrollView(
//          padding: EdgeInsets.all(10),
//          child: Container(
//            height: MediaQuery.of(context).size.height / 1.2,
//            child: Center(
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  ShowUp(
//                    delay: time + 500,
//                    child: OutlineButton(
//                      onPressed: () async {
//                        try {
//                          final result =
//                              await InternetAddress.lookup("google.com");
//                          if (result.isNotEmpty &&
//                              result[0].rawAddress.isNotEmpty) {
//                            signInWithGoogle();
//                          }
//                        } on SocketException catch (_) {
//                          showDialog(
//                              context: context,
//                              builder: (_) => CupertinoAlertDialog(
//                                    title: Text("No Internet",
//                                        style: TextStyle(
//                                            color: Colors.white,
//                                            fontSize: 19,
//                                            fontWeight: FontWeight.w500)),
//                                    content: Text(
//                                        "\nMake sure you are connected to the internet and try again"),
//                                    actions: <Widget>[
//                                      CupertinoDialogAction(
//                                        child: Text("Ok"),
//                                        onPressed: () {
//                                          Navigator.pop(context);
//                                        },
//                                      )
//                                    ],
//                                  ));
//                        }
//                      },
//                      borderSide: BorderSide(color: Colors.white),
//                      shape: StadiumBorder(),
//                      child: Text(
//                        'Sign in with Google',
//                        style: TextStyle(color: Colors.white),
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
