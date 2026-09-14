import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final double horizontalMarginFactor;
  final double verticalMarginFactor;
  final double height;

  const Button({
    super.key,
    required this.label,
    required this.onTap,
    this.horizontalMarginFactor = 0.2,
    this.verticalMarginFactor = 0.03,
    this.height = 0.06,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final textScaler = MediaQuery.of(context).textScaler;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff1B75BB), Color(0xff3E73B1)],
          ),
          borderRadius: BorderRadius.circular(
            (screenHeight * 0.1).clamp(10.0, 20.0),
          ),
        ),
        width: double.infinity,
        margin: EdgeInsets.only(
          top: (screenHeight * verticalMarginFactor).clamp(10.0, 20.0),
          left: (screenWidth * horizontalMarginFactor),
          right: (screenWidth * horizontalMarginFactor),
        ),
        height: (screenHeight * height).clamp(40.0, 60.0),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(fontSize: textScaler.scale(18), color: Colors.white),
        ),
      ),
    );
  }
}
