import 'package:flutter/material.dart';

class CreateAlbum extends StatefulWidget {

  final String text;
  final Color color;

  CreateAlbum({@required this.text,this.color});

  @override
  _CreateAlbumState createState() => _CreateAlbumState();
}

class _CreateAlbumState extends State<CreateAlbum> {
  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
        color: widget.color.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
        child: Text(widget.text, style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
      ),
    );
  }
}