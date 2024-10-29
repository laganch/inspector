// ignore: file_names
import 'package:airs_inspector/login.dart';
import 'package:airs_inspector/payment.dart';
import 'package:airs_inspector/verification/asin.dart';
import 'package:airs_inspector/verification/bp.dart';
import 'package:airs_inspector/verification/contact.dart';
import 'package:airs_inspector/verification/genuine.dart';
import 'package:airs_inspector/verification/payment.dart';
import 'package:airs_inspector/verification/phoneVerification.dart';
import 'package:airs_inspector/verification/rw.dart';
import 'package:airs_inspector/verification/signin.dart';
import 'package:airs_inspector/verification/signout.dart';
import 'package:airs_inspector/verification/signoutDisplay.dart';
import 'package:airs_inspector/verification/succesSignin.dart';
import 'package:airs_inspector/verification/success.dart';
import 'package:airs_inspector/verification/tc.dart';
import 'package:airs_inspector/verification/tcc.dart';
import 'package:airs_inspector/verification/tcode.dart';
import 'package:airs_inspector/verification/tcodeDashboard.dart';
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
    activeWidget = Home(
        callRw,
        callContact,
        callValidity,
        callOriginal,
        callTcode,
        callLogin,
        callPayment,
        callTcc,
        callBP,
        callPayVerify,
        callAsinSearch);
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
      activeWidget = MyDashboard();
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

  callBP() {
    setState(() {
      activeWidget = const Premises();
    });
  }

  callTcc() {
    setState(() {
      activeWidget = const Tcc();
    });
  }

  callPayVerify() {
    setState(() {
      activeWidget = const PaymentVerify();
    });
  }

  callAsinSearch() {
    setState(() {
      activeWidget = const Asin();
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
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold))),
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
      routes: {
        "/dashboard": (context) => MyDashboard(),
        "/dashboards": (context) => const MainApp(),
        "/tcode": (context) => const TCode(),
        "/signin": (context) => const SignIn(),
        "/signout": (context) => const SignoOut(),
        "/verify": (context) => OtpInputExample(),
        "/conditions": (context) => const Conditions(),
        "/display": (context) => const SignoutDisplay(),
        "/success": (context) => SuccessScreen(),
        "/successs": (context) => SignInSuccessScreen(),
      },
    );
  }
}
