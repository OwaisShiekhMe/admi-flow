import 'package:admi_flow/reusable_components/app_scaffold.dart';
import 'package:admi_flow/reusable_components/button.dart';
import 'package:admi_flow/reusable_components/otp_field_row.dart';
import 'package:admi_flow/view/role_selection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  String? receivedOtp;
  final GlobalKey<OtpFieldRowState> otpFieldRowKey =
      GlobalKey<OtpFieldRowState>();
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    final textScaler = MediaQuery.of(context).textScaler;
    return AppScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                (deviceHeight * 0.02).clamp(10.0, 20.0),
              ),
            ),
            height: (deviceHeight * 0.5).clamp(300.0, 500.0),
            width: (deviceWidth * 0.9).clamp(200.0, 400.0),
            child: Column(
              children: [
                Image.asset(
                  'images/logo.png',
                  height: (deviceHeight * 0.1).clamp(50.0, 100.0),
                  width: (deviceWidth * 0.2).clamp(100.0, 200.0),
                ),
                Text(
                  "OTP Verification",
                  style: GoogleFonts.manrope(
                    fontSize: textScaler.scale(20),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Enter 6-digit OTP sent to your email',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.manrope(
                    fontSize: textScaler.scale(16),
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: (deviceHeight * 0.03).clamp(10.0, 20.0)),
                OtpFieldRow(
                  key: otpFieldRowKey,
                  numberOfFields: 6,
                  onOtpSubmitted: (otp) {
                    setState(() {
                      receivedOtp = otp;
                    });
                  },
                ),
                Button(
                  label: "Verify Otp",
                  onTap: () {
                    if (receivedOtp != null) {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  RoleSelection(),
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
                      otpFieldRowKey.currentState?.clearFields();
                      setState(() {
                        receivedOtp = null;
                      });
                    }
                  },
                ),
                SizedBox(height: (deviceHeight * 0.02).clamp(10.0, 20.0)),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Didn't receive the OTP? ",
                        style: GoogleFonts.manrope(
                          fontSize: textScaler.scale(14),
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: "Resend OTP",
                        style: GoogleFonts.manrope(
                          fontSize: textScaler.scale(14),
                          color: Color(0xff005C98),
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                // Handle resend OTP logic here
                              },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
