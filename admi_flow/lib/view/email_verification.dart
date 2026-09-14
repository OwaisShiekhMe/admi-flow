import 'package:admi_flow/reusable_components/app_scaffold.dart';
import 'package:admi_flow/reusable_components/button.dart';
import 'package:admi_flow/reusable_components/custom_input_field.dart';
import 'package:admi_flow/view/otp_verification.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    final TextEditingController emailController = TextEditingController();
    final textScaler = MediaQuery.of(context).textScaler;
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: deviceHeight * 0.06),
          Image.asset(
            'images/logo.png',
            height: deviceHeight * 0.2,
            width: deviceWidth * 0.4,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: deviceWidth * 0.1),
            width: double.infinity,
            height: deviceHeight * 0.35,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(deviceHeight * 0.02),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: deviceHeight * 0.04),
                Text(
                  "Verify Your Email",
                  style: GoogleFonts.manrope(
                    fontSize: textScaler.scale(20),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Enter your email to get started",
                  style: GoogleFonts.manrope(
                    fontSize: textScaler.scale(16),
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: deviceHeight * 0.01),
                CustomInputField(
                  hint: "john.doe@example.com",
                  label: "Email",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email,
                  horizontalMarginFactor: 0.1,
                ),
                SizedBox(height: deviceHeight * 0.03),
                Button(
                  label: "Verify Email",
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder:
                            (context, animation, secondaryAnimation) =>
                                OtpVerification(),
                        transitionsBuilder: (
                          context,
                          animation,
                          secondaryAnimation,
                          child,
                        ) {
                          return ScaleTransition(
                            scale: Tween<double>(
                              begin: 0.8,
                              end: 1.0,
                            ).animate(animation),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  horizontalMarginFactor: 0.1,
                  verticalMarginFactor: 0.0,
                  height: 0.06,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
