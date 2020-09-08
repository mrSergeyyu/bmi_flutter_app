import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  BackgroundContainer({@required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300,
              offset: Offset(5, 5),
              blurRadius: 10.0,
              spreadRadius: 0.0),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.symmetric(vertical: 20),
      child: child,
    );
  }
}
