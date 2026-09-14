import 'package:admi_flow/reusable_components/otp_input_field.dart';
import 'package:flutter/material.dart';

class OtpFieldRow extends StatefulWidget {
  final int numberOfFields;
  final Function(String) onOtpSubmitted;
  const OtpFieldRow({
    super.key,
    required this.numberOfFields,
    required this.onOtpSubmitted,
  });

  @override
  State<OtpFieldRow> createState() => OtpFieldRowState();
}

class OtpFieldRowState extends State<OtpFieldRow> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(
      widget.numberOfFields,
      (_) => TextEditingController(),
    );
    focusNodes = List.generate(widget.numberOfFields, (_) => FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 400),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(widget.numberOfFields, (index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: (screenWidth * 0.02).clamp(8.0, 16.0),
            ),
            child: OtpInputField(
              controller: controllers[index],
              focusNode: focusNodes[index],
              onChanged:
                  (value) => setState(() {
                    if (value.isNotEmpty && index < widget.numberOfFields - 1) {
                      focusNodes[index + 1].requestFocus();
                    } else if (value.isEmpty && index > 0) {
                      focusNodes[index - 1].requestFocus();
                    }
                    // Submit OTP when all fields are filled
                    if (controllers.every(
                      (controller) => controller.text.isNotEmpty,
                    )) {
                      String otp =
                          controllers
                              .map((controller) => controller.text)
                              .join();
                      widget.onOtpSubmitted(otp);
                    }
                  }),
            ),
          );
        }),
      ),
    );
  }

  void clearFields() {
    for (var controller in controllers) {
      controller.clear();
    }
    focusNodes[0].requestFocus();
  }
}
