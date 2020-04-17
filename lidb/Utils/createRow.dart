import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class createRow extends StatefulWidget {

  final String text;
  final double width;
  final Color color;
  final Widget icon;

  createRow({@required this.width,this.text,this.color,this.icon});
  @override
  _createRowState createState() => _createRowState();
}

class _createRowState extends State<createRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: widget.width,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: widget.color),
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          child: Row(
            children: <Widget>[
              SizedBox(width: 15,),
              Text(widget.text,style: TextStyle(color: Colors.white,fontSize: 25),),
            ],
          ),
        ),
      ],
    );
  }
}
