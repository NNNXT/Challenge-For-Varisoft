import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  final Color textColor;
  final textAlign;

  TitleText({
    @required this.text,
    this.textColor = Colors.black,
    this.textAlign = TextAlign.start
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Text(
      text,
      textAlign: this.textAlign,
      style: TextStyle(
        fontSize: height * 0.028,
        color: this.textColor
      )
    );
  }
}

class SubTitleText extends StatelessWidget {
  final String text;
  final Color textColor;
  final textAlign;

  SubTitleText({
    @required this.text,
    this.textColor = Colors.black,
    this.textAlign = TextAlign.start
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Text(
      text,
      textAlign: this.textAlign,
      style: TextStyle(
        fontSize: height * 0.021,
        color: this.textColor
      )
    );
  }
}

class ContentText extends StatelessWidget {
  final String text;
  final Color textColor;
  final textAlign;

  ContentText({
    @required this.text,
    this.textColor = Colors.black,
    this.textAlign = TextAlign.start
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Text(
      text,
      textAlign: this.textAlign,
      style: TextStyle(
        fontSize: height * 0.015,
        color: this.textColor
      )
    );
  }
}