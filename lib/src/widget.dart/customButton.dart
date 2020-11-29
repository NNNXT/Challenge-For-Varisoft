import 'package:flutter/material.dart';
import 'package:opentalk/src/widget.dart/sizeText.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final onTap;
  final bool showNavigateNextIcon;

  CustomButton({
    @required this.text,
    @required this.onTap,
    this.showNavigateNextIcon = false
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: InkWell(
        onTap: onTap,
        child: Container(
          child: Center(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SubTitleText(
                    text: text,
                    textColor: Colors.white
                  ),
                ),
              if (this.showNavigateNextIcon)
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: size.width * 0.125),
                    child: Icon(
                      Icons.navigate_next,
                      color: Colors.white
                    ),
                  ),
                )
              ],
            )
          ),
          height: size.height * 0.065,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius : BorderRadius.all(
              Radius.circular(size.height * 0.01)
            ),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF1A73E9),
                Color(0xFF6C92F4)
              ]
            )
          )
        )
      )
    );
  }
}