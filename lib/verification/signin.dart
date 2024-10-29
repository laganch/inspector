import 'dart:convert';
// import 'dart:js_interop';

import 'package:airs_inspector/models/enforcementDto.dart';
import 'package:airs_inspector/models/phoneDto.dart';
import 'package:airs_inspector/verification/application.dart';
import 'package:airs_inspector/verification/phoneVerification.dart';
import 'package:airs_inspector/verification/signoutInfo.dart';
import 'package:airs_inspector/verification/tcodeDashboard.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../baseUrl.dart';
import '../myApp.dart';

bool isLoading = false;
bool isError = false;
bool show = false;
var response = "";

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<StatefulWidget> createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  var plateNo = TextEditingController();
  bool isChecked = false;
  void validateUser() async {
    if (plateNo.text.trim() == "") {
      setState(() {
        show = true;
      });
      return;
    }
    setState(() {
      isLoading = true;
      show = false;
    });
    response = await BaseClient()
        .post("apply/signin?plate=${plateNo.text}", "")
        .catchError((err) {});
    if (response == "") {
      setState(() {
        isError = true;
        isLoading = false;
      });
      return;
    }

    setState(() {
      isLoading = false;
    });
    print(response);
    if (response.contains("OK")) {
      Future.microtask(() {
        try {
          Navigator.popAndPushNamed(context, "/successs");
        } catch (e) {
          print("Navigation error: $e");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return MyDashboard();
                },
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Form(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                "Enter Tcode/Ucode/Plate Number",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),
                  LengthLimitingTextInputFormatter(14)
                ],
                controller: plateNo,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Tcode/Ucode/Plate Number",
                  prefixIcon: const Icon(Icons.abc),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              show
                  ? const Text(
                      "Fill All Required Fields",
                      style: TextStyle(color: Colors.red, fontSize: 11),
                      textAlign: TextAlign.start,
                    )
                  : const Text(""),
              const SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value ?? false;
                          });
                        },
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text:
                                'To proceed with this process, I accept that I have read and accepted the ',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 12),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Terms and Conditions',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.popAndPushNamed(
                                        context, "/conditions");
                                  },
                              ),
                              const TextSpan(
                                text: ' attached.',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: isLoading || !isChecked ? null : validateUser,
                    child: const Text(
                      "Accept and Continue",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  response.contains("cannot") && !isLoading
                      ? Text(response)
                      : isLoading
                          ? const CircularProgressIndicator()
                          : const Text(""),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
