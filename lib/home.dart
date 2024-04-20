import 'package:airs_inspector/card.dart';
import 'package:airs_inspector/verification/privacy.dart';
import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';

class Home extends StatelessWidget {
  Home(this.callRw, this.callContact, this.callValidity, this.callOriginal,
      this.callTcode, this.callLogin, this.callPayment,
      {super.key});

  final Function() callRw,
      callLogin,
      callContact,
      callTcode,
      callValidity,
      callOriginal,
      callPayment;

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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyCard(
                      "Road Worthiness", "assets/rw.png", callRw, Colors.cyan),
                  MyCard("Validity", "assets/validity.png", callValidity,
                      Colors.orange),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyCard("TCode/Ucode", "assets/tcode.jpeg", callTcode,
                      Colors.green),
                  MyCard("Heavy Duty", "assets/guniune.png", callOriginal,
                      Colors.teal),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // MyCard("Make Payment", "assets/login.jpeg", callPayment, Colors.indigoAccent),
                  MyCard("Contact Us", "assets/contact.png", callContact,
                      Colors.purpleAccent)
                ],
              ),
            ],
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
                          style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline),),
                      TextSpan(text:'\n https://www.tax.services.an.gov.ng', style: TextStyle(fontSize: 9)),
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
