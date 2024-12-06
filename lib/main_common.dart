import 'package:cicd_flavor/app_widgets.dart';
import 'package:cicd_flavor/config_reader.dart';
import 'package:cicd_flavor/environment.dart';
import 'package:flutter/material.dart';

Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();

  await ConfigReader.initialize();

  // ignore: unused_local_variable
  Color primaryColor;
  switch (env) {
    case Environment.dev:
      primaryColor = Colors.blue;
      break;
    case Environment.prod:
      primaryColor = Colors.red;
      break;
    default:
      primaryColor = Colors.grey;
  }
  runApp(MyApp(primaryColor: primaryColor));
}
