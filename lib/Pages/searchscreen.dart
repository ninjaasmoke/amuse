import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Search"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10, horizontal: 20
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            CupertinoTextField(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal:10),
              decoration: BoxDecoration(
                color: Color(0xff202020),
                borderRadius: BorderRadius.circular(5)
              ),
              autocorrect: false,
              placeholder: 'Search songs from memory',
              style: TextStyle(color: Colors.white),
              cursorColor: CupertinoColors.activeGreen,
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
              onPressed: () async {
                Navigator.pop(context);
              },
              label: Text("Home",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 18,letterSpacing: 0),),
              backgroundColor: Colors.grey[100],
              icon: Icon(CupertinoIcons.home,color: Colors.black,),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
