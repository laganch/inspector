import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardCard extends StatelessWidget {
  final String message;
  final String image;
  final String image2;
  final void Function() callScreen;
  final Color color;

  const DashboardCard(
      this.message, this.image, this.callScreen, this.color, this.image2,
      {super.key});

  @override
  Widget build(context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: const BorderSide(
            color: Colors.greenAccent,
            width: 0.5,
          ),
        ),
        elevation: 70,
        shadowColor: Colors.white,
        color: color,
        child: SizedBox(
            width: 350,
            height: 75,
            child: GestureDetector(
              onTap: callScreen,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Row(children: [
                  Image.asset(image),
                  const SizedBox(
                    height: 10,
                    width: 20,
                  ), //SizedBox
                  Text(
                    message,
                    style: GoogleFonts.lato(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center, //Textstyle
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  image2.isNotEmpty
                      ? Image.asset(image2)
                      : const SizedBox(
                          width: 0, // Adjust the width and height as needed
                          height: 0,
                          child: Center(
                            child: Text(''),
                          ),
                        ),
                ]),
              ),
            )),
      ),
    );
  }
}
