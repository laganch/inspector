import 'package:airs_inspector/screens/tcodeScreen.dart';
import 'package:airs_inspector/verification/application.dart';
import 'package:airs_inspector/verification/tcode.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../myApp.dart';

bool isLoading = false;

class SignOutInfo extends StatefulWidget {
  const SignOutInfo({super.key});

  @override
  State<StatefulWidget> createState() => _SignOutInfo();
}

class _SignOutInfo extends State<SignOutInfo> {
  void SignOut() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => const UserApplications(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Anambra Inspector"),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const TCode();
                  },
                ),
              );
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        body: SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(children: [
              Image.asset("assets/logo.png", width: 100, height: 200,),
              Text(
                "Important Notice for Vehicle Owners and Drivers",
                style: GoogleFonts.acme(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Dear valued vehicle owners and drivers:",
                style: GoogleFonts.acme(color: Colors.black, fontSize: 14),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 3,
              ),
              RichText(
                text: const TextSpan(
                  text: 'You have the option to sign out your vehicle for various reasons including illness, ',
                  children: <TextSpan>[
                    TextSpan(
                        text: 'travel, maintenance, loss, and more.',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' However, before you proceed with the sign-out process, we kindly request your attention to the following terms and conditions:'),
                    TextSpan(
                        text: ' \n\nBy initiating and receiving approval for the sign-out request, you are making a commitment to keep your vehicle off the road for the specified duration, beginning from the requested date, until you formally sign in again.',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'We emphasize the importance of adhering to this commitment, as any breach of this condition may result in severe consequences. These consequences may include a substantial fine of N50,000 or, in the most severe cases, the possibility of your vehicle being impounded or encountering enforcement actions. \n\nTo acknowledge your understanding and agreement with these terms and conditions,kindly click Accept and Continue. Thank you for adhering to these terms and conditions \n \nSincerely,\nAIRS'),
                  ],
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: isLoading ? null : SignOut,
                child: const Text("Accept and Continue", style: TextStyle(color: Colors.white),),
              ),
            ]),
          ),
        ));
  }
}
