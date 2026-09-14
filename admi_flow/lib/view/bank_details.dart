import 'package:admi_flow/reusable_components/app_scaffold.dart';
import 'package:admi_flow/reusable_components/button.dart';
import 'package:admi_flow/reusable_components/custom_input_field.dart';
import 'package:admi_flow/reusable_components/drop_down_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BankDetails extends StatefulWidget {
  const BankDetails({super.key});

  @override
  State<BankDetails> createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    final textScaler = MediaQuery.of(context).textScaler;
    final formKey = GlobalKey<FormState>();
    final TextEditingController accountTitleController =
        TextEditingController();
    final TextEditingController accountNumberController =
        TextEditingController();
    final TextEditingController ibanController = TextEditingController();
    final TextEditingController branchCodeController = TextEditingController();

    return AppScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Bank Details",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.05),
        child: ListView(
          children: [
            SizedBox(height: deviceHeight * 0.03),
            Text(
              "Secure Payouts",
              style: GoogleFonts.manrope(
                fontSize: textScaler.scale(20),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: deviceHeight * 0.01),
            Text(
              "Please provide your banking details accurately. This information is securely stored and will be used across connected services such as fee payments and future financial features, so you won’t need to re‑enter it again",
              style: GoogleFonts.manrope(
                fontSize: textScaler.scale(14),
                color: Colors.white,
              ),
            ),
            SizedBox(height: deviceHeight * 0.03),
            Container(
              height: deviceHeight * 0.55,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(deviceWidth * 0.05),
                ),
                gradient: LinearGradient(
                  colors: [Color(0xffA8E6CF), Color(0xffD0F0FD)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Form(
                key: formKey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    CustomInputField(
                      hint: "John Doe",
                      label: "Account Title",
                      controller: accountTitleController,
                      horizontalMarginFactor: 0.03,
                      prefixIcon: Icons.person,
                    ),
                    SizedBox(height: deviceHeight * 0.02),
                    Dropdownfield(
                      options: [
                        "Meezan Bank",
                        "Habib Bank",
                        "Bank Al Habib",
                        "UBL Bank",
                      ],
                      initialValue: "Meezan Bank",
                      label: "Bank Name",
                      onChanged: (value) {},
                    ),
                    CustomInputField(
                      hint: "300",
                      label: "Branch Code",
                      controller: branchCodeController,
                      horizontalMarginFactor: 0.03,
                      prefixIcon: Icons.location_city,
                    ),
                    CustomInputField(
                      hint: "1234567890123456",
                      label: "Account Number",
                      controller: accountNumberController,
                      horizontalMarginFactor: 0.03,
                      prefixIcon: Icons.account_balance,
                    ),
                    CustomInputField(
                      hint: "PK36SCBL0000001123456702",
                      label: "IBAN",
                      controller: ibanController,
                      horizontalMarginFactor: 0.03,
                      prefixIcon: Icons.language,
                    ),
                    SizedBox(height: deviceHeight * 0.05),
                    Button(
                      label: "Complete Setup",
                      horizontalMarginFactor: 0.03,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          // Handle form submission logic here
                        }
                      },
                    ),
                    SizedBox(height: deviceHeight * 0.05),
                  ],
                ),
              ),
            ),
            Container(
              height: deviceHeight * 0.2,
              width: double.infinity,
              margin: EdgeInsets.only(
                left: deviceWidth * 0.05,
                right: deviceWidth * 0.05,
                top: deviceHeight * 0.03,
                bottom: deviceHeight * 0.03,
              ),
              padding: EdgeInsets.all(deviceWidth * 0.04),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(deviceWidth * 0.05),
                ),
                color: Color(0xff1B75BB).withAlpha(128),
              ),
              child: Row(
                children: [
                  Icon(Icons.lock, color: Colors.white),
                  SizedBox(width: deviceWidth * 0.03),
                  SizedBox(
                    width: deviceWidth * 0.6,
                    child: Text(
                      "Your banking details are encrypted and stored according to industry-standard PCI-DSS guidelines",
                      style: GoogleFonts.manrope(
                        fontSize: textScaler.scale(14),
                        color: Colors.white,
                      ),
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
