import 'package:flutter/material.dart';

class TextTitleWidget extends StatelessWidget {

  final String text;
  final Alignment alignment;

  TextTitleWidget({@required this.text, this.alignment});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment?? Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 14.0, top: 5.0, bottom: 5.0),
        child: Text(
          text,
          style: TextStyle(color: Colors.orange,fontSize: 20.0,fontWeight: FontWeight.w300),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}