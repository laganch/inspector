import 'package:flutter/material.dart';
import 'package:airs_inspector/myApp.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await _initHive();
  runApp(MainApp());
}

Future<void> _initHive() async{
  await Hive.initFlutter();
  await Hive.openBox("login");
  await Hive.openBox("accounts");
}