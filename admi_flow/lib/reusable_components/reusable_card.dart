import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final double height;
  final double verticalMarginFactor;
  final double horizontalMarginFactor;
  final String title;
  final String description;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;
  const ReusableCard({
    super.key,
    required this.height,
    required this.title,
    required this.description,
    required this.icon,
    this.verticalMarginFactor = 0.03,
    this.horizontalMarginFactor = 0.2,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final textScaler = MediaQuery.of(context).textScaler;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenHeight * 0.02),
          border: Border.all(
            color: isSelected ? Color(0xff3E73B1) : Colors.transparent,
            width: 2.0,
          ),
        ),
        margin: EdgeInsets.only(
          top: screenHeight * verticalMarginFactor,
          left: screenWidth * horizontalMarginFactor,
          right: screenWidth * horizontalMarginFactor,
        ),
        padding: EdgeInsets.all(screenHeight * 0.02),
        child: Row(
          children: [
            Icon(icon, size: textScaler.scale(40), color: Colors.black),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: textScaler.scale(18),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: textScaler.scale(14),
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
