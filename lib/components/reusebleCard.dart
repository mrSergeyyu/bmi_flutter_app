import 'package:flutter/material.dart';

class ReusebleCard extends StatelessWidget {
  ReusebleCard(
      {@required this.color,
      @required this.children,
      this.onPress,
      @required this.borderColor});

  final List<Color> color;
  final Widget children;
  final Function onPress;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: color,
          ),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 0.2,
            color: borderColor,
          ),
        ),
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
        padding: EdgeInsets.all(10),
        child: children,
      ),
    );
  }
}
