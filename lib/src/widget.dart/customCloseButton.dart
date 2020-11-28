import 'package:flutter/material.dart';

class CustomCloseButton extends StatelessWidget {
  final bool canBack;

  CustomCloseButton({
    this.canBack = true
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(canBack ? Icons.arrow_back : Icons.close),
      onPressed: (){
        Navigator.pop(context);
    });
  }
}