import 'package:admi_flow/reusable_components/app_scaffold.dart';
import 'package:admi_flow/reusable_components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../reusable_components/button.dart';
import 'basic_info_parent.dart';

class RoleSelection extends StatefulWidget {
  const RoleSelection({super.key});

  @override
  State<RoleSelection> createState() => _RoleSelectionState();
}

class _RoleSelectionState extends State<RoleSelection> {
  String selectedRole = "";

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    final textScaler = MediaQuery.of(context).textScaler;
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: deviceHeight * 0.1),
          Image.asset(
            'images/logo.png',
            height: (deviceHeight * 0.2).clamp(100, 200),
            width: (deviceWidth * 0.4).clamp(200, 400),
          ),
          Text(
            "Select Your Role",
            style: GoogleFonts.manrope(
              fontSize: textScaler.scale(20),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            "Choose how you want to continue",
            style: GoogleFonts.manrope(
              fontSize: textScaler.scale(16),
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          ReusableCard(
            height: deviceHeight * 0.133,
            title: "Principal",
            isSelected: selectedRole == "Principal",
            description: "Manages admission of the school",
            icon: Icons.school,
            horizontalMarginFactor: 0.1,
            onTap: () {
              setState(() {
                selectedRole = "Principal";
              });
            },
          ),

          ReusableCard(
            height: deviceHeight * 0.133,
            title: "Parent",
            isSelected: selectedRole == "Parent",
            description: "Does online Admission",
            icon: Icons.family_restroom_rounded,
            horizontalMarginFactor: 0.1,
            onTap: () {
              setState(() {
                selectedRole = "Parent";
              });
            },
          ),

          Button(
            label: "Continue",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BasicInfoParent()),
              );
            },
            horizontalMarginFactor: 0.1,
            verticalMarginFactor: 0.06,
          ),
        ],
      ),
    );
  }
}
