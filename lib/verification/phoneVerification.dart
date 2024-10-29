import 'dart:async';
import 'dart:convert';

import 'package:airs_inspector/models/phoneDto.dart';
import 'package:airs_inspector/verification/signout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpInputExample extends StatefulWidget {
  @override
  _OtpInputExampleState createState() => _OtpInputExampleState();
}

bool _isVisible = false;
var errorMessage = "";

class _OtpInputExampleState extends State<OtpInputExample> {
  // Create a list of controllers for each input field
  List<TextEditingController> controllers =
      List.generate(6, (index) => TextEditingController());
  // Create a list of focus nodes for each input field
  List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void dispose() {
    // Dispose of the controllers and focus nodes when done
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  String getOtp() {
    // Combine the text from each controller to form the full OTP
    return controllers.map((controller) => controller.text).join();
  }

  @override
  Widget build(BuildContext context) {
    final PhoneDto dto = ModalRoute.of(context)!.settings.arguments as PhoneDto;

    print(dto.phone_number);

    getPhonePart() {
      if (dto.phone_number!.length >= 6) {
        return dto.phone_number!.substring(dto.phone_number!.length - 4);
      }
    }

    getPhoneUser() {
      if (dto.phone_number!.length >= 6) {
        return dto.phone_number!.substring(0, dto.phone_number!.length - 4);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Out"),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SignoOut();
                },
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Image(image: AssetImage("assets/call.png")),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Verify your phone number to sign out your account",
              style: GoogleFonts.acme(color: Colors.black, fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Enter the last 6 digits of the phone number attached to the TCODE ending in ",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${getPhoneUser()}",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "****",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(38.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  return SizedBox(
                    width: 50,
                    child: TextFormField(
                      controller: controllers[index],
                      focusNode: focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1, // Allow only one digit
                      decoration: const InputDecoration(
                        counterText: '', // Hide the length counter
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        // Move focus to the next field if a digit is entered
                        if (value.isNotEmpty && index < 3) {
                          focusNodes[index + 1].requestFocus();
                        }
                        // Move focus to the previous field if the input is empty
                        if (value.isEmpty && index > 0) {
                          focusNodes[index - 1].requestFocus();
                        }
                      },
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: _isVisible
                  ? Text(
                      errorMessage,
                      style: const TextStyle(fontSize: 20, color: Colors.red),
                      textAlign: TextAlign.center,
                    )
                  : const SizedBox(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (getOtp() == getPhonePart()) {
                  Navigator.popAndPushNamed(context, "/display",
                      arguments: dto);
                } else {
                  Timer(
                    const Duration(seconds: 5),
                    () {
                      setState(() {
                        _isVisible = false;
                      });
                    },
                  );
                  setState(() {
                    _isVisible = true;
                    errorMessage =
                        "Invalid Number, Please enter the last 4 digit of your Phone number";
                  });
                }
                // You can use the OTP here for further processing
              },
              child: const Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}
