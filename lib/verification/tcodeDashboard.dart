import 'package:airs_inspector/card.dart';
import 'package:airs_inspector/myApp.dart';
import 'package:airs_inspector/verification/dahboardCard.dart';
import 'package:airs_inspector/verification/privacy.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:hive_flutter/hive_flutter.dart';

class MyDashboard extends StatelessWidget {
  // const MyDashboard(this.callSignIn, this.callSignout, this.callValidation,
  //     {super.key});

  // final Function() callSignout, callSignIn, callValidation;

  // final Box _boxLogin = Hive.box("login");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Anambra Inspector",
          textAlign: TextAlign.center,
        ),
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const MainApp();
                },
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          Image.asset(
            'assets/logo.png',
            width: 85,
            height: 40,
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/login.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DashboardCard("Validate T/U Code Status", "assets/card1.png",
                        () {
                          Navigator.popAndPushNamed(context, "/tcode");
                        }, const Color.fromARGB(255, 0, 21, 37), ""),
                    DashboardCard("Sign-In Vehicle", "assets/card2.png",
                        () {
                           Navigator.popAndPushNamed(context, "/signin");
                        }, const Color.fromARGB(255, 3, 106, 7),"assets/signin.png"),
                    DashboardCard("Sign-Out Vehicle", "assets/card1.png",
                        () {
                           Navigator.popAndPushNamed(context, "/signout");
                        }, Colors.red, "assets/signout.png"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Image.asset(
                'assets/powered.png',
                width: 5,
                height: 30,
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Privacy();
                      },
                    ),
                  );
                },
                child: RichText(
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                      TextSpan(
                          text: '\n https://www.tax.services.an.gov.ng',
                          style: TextStyle(fontSize: 9)),
                    ],
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
