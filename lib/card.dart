import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCard extends StatelessWidget {
  final String message;
  final String image;
  final void Function() callScreen;
  final Color color;

  const MyCard(this.message, this.image, this.callScreen, this.color,
      {super.key});

  @override
  Widget build(context) {
    return Center(
      child: GestureDetector(
        onTap: callScreen,
        child: Card(
            elevation: 50,
            shadowColor: Colors.black,
            color: color,
            child: SizedBox(
              width: 120,
              height: 120,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  CircleAvatar(
                    backgroundColor: color,
                    radius: 18,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(image), //NetworkImage
                      radius: 40,
                    ), //CircleAvatar
                  ),
                  const SizedBox(
                    height: 10,
                  ), //SizedBox
                  Text(
                    message,
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center, //Textstyle
                  ),
                ]),
              ),
            )),
      ),
    );
  }
}
