import 'package:flutter/material.dart';
import 'package:opentalk/src/widget.dart/sizeText.dart';

class CustomButton extends StatelessWidget {
  final String text;

  CustomButton({
    @required this.text
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: InkWell(
        onTap: (){},
        child: Container(
          child: Center(
            child: SubTitleText(
              text: text,
              textColor: Colors.white
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