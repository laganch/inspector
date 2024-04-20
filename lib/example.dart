import 'package:flutter/material.dart';
import 'dart:math';

// void main() {
//   runApp(const MyApp());
// }

// ignore: must_be_immutable
class GradientContainer extends StatelessWidget {
  GradientContainer(this.color, {super.key});

  final List<Color> color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: color,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Center(
        child: RoleDice(),
      ),
    );
  }
}



class MyStyle extends StatelessWidget {
  const MyStyle(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: const TextStyle(
        color: Color.fromARGB(255, 228, 226, 219),
        fontSize: 22,
      ),
    );
  }
}

class RoleDice extends StatefulWidget {
  const RoleDice({super.key});
  @override
  State<StatefulWidget> createState() {
    return _RoleDiceState();
  }
}

class _RoleDiceState extends State<RoleDice> {
  var activeImage = "assets/dice-3.png";
  var activeSecondImage = "assets/dice-5.png";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              activeImage,
              width: 150,
            ),
            Image.asset(
              activeSecondImage,
              width: 150,
            )
          ],
        ),
        TextButton(
          onPressed: null,
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 20)),
          child: const Text("Role Dice"),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: ElevatedButton(
            onPressed: changeImage,
            child: const Text(
              "Role New Dice",
              style: TextStyle(fontSize: 16),
            ),
          ),
        )
      ],
    );
  }

  void changeImage() {
    setState(() {
      var diceNo = Random().nextInt(6) + 1;
      var diceNo2 = Random().nextInt(6) + 1;
      activeImage = "assets/dice-$diceNo.png";
      activeSecondImage = "assets/dice-$diceNo2.png";
    });
  }
}
