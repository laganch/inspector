import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../myApp.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<StatefulWidget> createState() => _Contact();
}

class _Contact extends State<Contact> {
  
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
                        return  const MainApp();
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
          child: Column(
            children: [
              const Icon(
                Icons.contact_support_sharp,size: 200,
              ),
              Text("Stay In touch with our team", 
              style: GoogleFonts.acme(
                color: Colors.black,
                fontWeight: FontWeight.bold,fontSize: 18
              ),
              textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10,),
              Text("Contact us in the following numbers", 
              style: GoogleFonts.lato(
                color: Colors.black,
                fontWeight: FontWeight.bold,fontSize: 16
              ),
              textAlign: TextAlign.center,
              ),
              SizedBox(height: 5,),
              Text("+234 701 3234 481", 
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,fontSize: 16
              )
              ),
              SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("E-mail: ", 
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,fontSize: 16
                  )
                  ),
                  Text("info@oasismgt.net", 
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,fontSize: 16
                  )
                  ),
                ],
              )
             
          ]),
        ),
      )
    );
  }
}
