import 'package:flutter/material.dart';

import '../myApp.dart';

class MyBar extends StatelessWidget {
  const MyBar({super.key});

  @override
  Widget build(context) {
    return AppBar(
      title: const Text("Anambra Inspector"),
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
    );
  }
}
