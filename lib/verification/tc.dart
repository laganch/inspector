import 'package:airs_inspector/myApp.dart';
import 'package:airs_inspector/verification/signout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Conditions extends StatefulWidget {
  const Conditions({super.key});

  @override
  State<StatefulWidget> createState() => _Conditions();
}

class _Conditions extends State<Conditions> {
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
                  return const SignoOut();
                },
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: SizedBox(
        child: ListView(
          children: [
            SizedBox(
              child: Container(
                decoration: const BoxDecoration(),
                margin: const EdgeInsets.all(15),
                child: Column(children: [
                  SizedBox(height: 20,),
                  Image(image: AssetImage("assets/logo.png"), width: 100, height: 100,),
                  SizedBox(height: 20,),
                  Text(
                    "Important Notice for Vehicle Owners and Drivers",
                    style: GoogleFonts.acme(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Dear valued vehicle owners and drivers:'),
                      ],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: '',
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'You have the option to sign out your vehicle for various reasons including illness, travel, maintenance, loss and more. However, before you proceed with the sign-out process, we kindly request your attention to the following terms and conditions \n\nBy initiating and receiving approval for the sign-out request, you are making a commitment to your vehicle off the road for the specified duration, beginning from the requested date, until you formally sign in again. We emphasize the importance of adhering to this commitment, as any branch of this condition may result in severe consequences. \nThese consequences may include a substantial fine of N50,000 or, in the most severe cases, the possibility of your vehicle being impounded or encountering enforcement actions.\nTo acknowledge your understanding and agreement with these terms and conditions, kindly click Accept and Continue. \n\nThank you for adhering to these terms and conditions',
                        ),
                        TextSpan(text: ''),
                      ],
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: 'Sincerely,\nAIRS'),
                      ],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

mixin also {}
