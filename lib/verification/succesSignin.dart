import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInSuccessScreen extends StatefulWidget {
  @override
  _SignInSuccessScreen createState() => _SignInSuccessScreen();
}

class _SignInSuccessScreen extends State<SignInSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Success"),
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              const Image(
                image: AssetImage("assets/success.png"),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Vehicle Signed In successfully",
                style: GoogleFonts.acme(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 100,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.popAndPushNamed(context, "/dashboard");
                },
                child: const Text(
                  "Continue to Dashboard",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
