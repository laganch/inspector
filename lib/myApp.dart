// ignore: file_names
import 'package:airs_inspector/login.dart';
import 'package:airs_inspector/payment.dart';
import 'package:airs_inspector/verification/contact.dart';
import 'package:airs_inspector/verification/genuine.dart';
import 'package:airs_inspector/verification/rw.dart';
import 'package:airs_inspector/verification/tcode.dart';
import 'package:airs_inspector/verification/validity.dart';
import 'package:flutter/material.dart';
import 'package:airs_inspector/home.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainApp();
  }
}

class _MainApp extends State<MainApp> {
  Widget? activeWidget;

  @override
  void initState() {
    activeWidget = Home(callRw, callContact, callValidity, callOriginal, callTcode, callLogin, callPayment);
    super.initState();
  }

  callRw() {
    setState(() {
      activeWidget = const Rworthiness();
    });
  }

  callContact() {
    setState(() {
      activeWidget = const Contact();
    });
  }

  callValidity() {
    setState(() {
      activeWidget = const Validity();
    });
  }

  callOriginal() {
    setState(() {
      activeWidget = const Original();
    });
  }

  callTcode() {
    setState(() {
      activeWidget = const TCode();
    });
  }

    callLogin() {
    setState(() {
      activeWidget = const Login();
    });
  }
    callPayment() {
    setState(() {
      activeWidget = const Payment();
    });
  }
var kColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 42, 4, 131));

var kDarkScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 75, 52, 25),
);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // darkTheme: ThemeData.dark().copyWith(colorScheme: kDarkScheme),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer),
        cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.all(10)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: kColorScheme.onPrimaryContainer,
          textStyle: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)
        )),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 15,
              ),
            ),
        useMaterial3: true,
      ),
      home: activeWidget,
    );
  }
}
