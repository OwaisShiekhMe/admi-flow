import 'package:admi_flow/reusable_components/button.dart';
import 'package:admi_flow/reusable_components/custom_input_field.dart';
import 'package:admi_flow/reusable_components/drop_down_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../reusable_components/app_scaffold.dart';

class BasicInfoParent extends StatefulWidget {
  const BasicInfoParent({super.key});

  @override
  State<BasicInfoParent> createState() => _BasicInfoParentState();
}

class _BasicInfoParentState extends State<BasicInfoParent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String gender = "Male";

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    final textScaler = MediaQuery.of(context).textScaler;
    return AppScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Basic Information",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: deviceHeight * 0.03),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey.shade300,
            child: const Icon(Icons.person, size: 50, color: Colors.white),
          ),
          SizedBox(height: deviceHeight * 0.03),
          Text(
            "John Doe",
            style: GoogleFonts.manrope(
              fontSize: textScaler.scale(20),
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(height: deviceHeight * 0.03),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.05),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffA8E6CF), Color(0xffD0F0FD)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(deviceHeight * 0.05),
                  topRight: Radius.circular(deviceHeight * 0.05),
                ),
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(height: deviceHeight * 0.03),
                  Text(
                    "Account Details",
                    style: GoogleFonts.manrope(
                      fontSize: textScaler.scale(18),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: deviceHeight * 0.01),
                  Text(
                    "Let us setup your account with some basic information.",
                    style: GoogleFonts.manrope(
                      fontSize: textScaler.scale(16),
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: deviceHeight * 0.03),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomInputField(
                          hint: "John",
                          label: "FirstName",
                          controller: firstNameController,
                          horizontalMarginFactor: 0.03,
                        ),
                        CustomInputField(
                          hint: "Doe",
                          label: "LastName",
                          controller: lastNameController,
                          horizontalMarginFactor: 0.03,
                        ),
                        SizedBox(height: deviceHeight * 0.02),
                        Dropdownfield(
                          label: "Gender",
                          options: ["Male", "Female", "Other"],
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          },
                          initialValue: gender,
                        ),
                        CustomInputField(
                          hint: "123-456-7890",
                          label: "Phone",
                          controller: phoneController,
                          horizontalMarginFactor: 0.03,
                        ),
                      ],
                    ),
                  ),
                  Button(
                    label: "Next",
                    onTap: () {},
                    horizontalMarginFactor: 0.03,
                  ),
                  SizedBox(height: deviceHeight * 0.02),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
