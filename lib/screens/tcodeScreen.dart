import 'package:airs_inspector/models/enforcementDto.dart';
import 'package:flutter/material.dart';

class TcodeScreens extends StatefulWidget {
  const TcodeScreens({super.key, required this.enforcementDto});

  final EnforcementDto enforcementDto;

  @override
  State<StatefulWidget> createState() {
    return _TcodeScreen();
  }
}

class _TcodeScreen extends State<TcodeScreens> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Reached here first"),
    );
  }
}
