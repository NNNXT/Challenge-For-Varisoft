import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  final Color textColor;

  TitleText({
    @required this.text,
    this.textColor = Colors.black
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Text(
      text,
      style: TextStyle(
        fontSize: height * 0.03,
        color: this.textColor
      )
    );
  }
}

class SubTitleText extends StatelessWidget {
  final String text;
  final Color textColor;

  SubTitleText({
    @required this.text,
    this.textColor = Colors.black
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Text(
      text,
      style: TextStyle(
        fontSize: height * 0.025,
        color: this.textColor
      )
    );
  }
}

class ContentText extends StatelessWidget {
  final String text;
  final Color textColor;

  ContentText({
    @required this.text,
    this.textColor = Colors.black
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: height * 0.02,
        color: this.textColor
      )
    );
  }
}