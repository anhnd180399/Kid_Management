
import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  final Color color;
  final double size;

  GoBackButton({this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(
          Icons.keyboard_backspace,
          color: this.color,
          size: this.size
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
