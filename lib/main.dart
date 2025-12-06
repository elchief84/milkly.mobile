import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_breastfeeding/app.dart';
import 'package:smart_breastfeeding/core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock orientation to portrait
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize dependencies
  await configureDependencies();

  runApp(const MilklyApp());
}
