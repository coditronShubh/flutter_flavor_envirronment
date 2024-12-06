import 'package:cicd_flavor/app_widgets.dart';
import 'package:cicd_flavor/bloc/config%20cubit/config_cubit_cubit.dart';
import 'package:cicd_flavor/config_reader.dart';
import 'package:cicd_flavor/environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();

  await ConfigReader.initialize();

  Color primaryColor;
  switch (env) {
    case Environment.dev:
      primaryColor = Colors.green;
      break;
    case Environment.prod:
      primaryColor = Colors.red;
      break;
    default:
      primaryColor = Colors.grey;
  }
  runApp(MultiBlocProvider(
    providers: [BlocProvider(create: (context) => ConfigCubit())],
    child: MyApp(primaryColor: primaryColor),
  ));
}
