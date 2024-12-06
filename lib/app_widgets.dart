import 'package:cicd_flavor/bloc/config%20cubit/config_cubit_cubit.dart';
import 'package:cicd_flavor/bloc/config%20cubit/config_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  final Color primaryColor;

  const MyApp({super.key, required this.primaryColor});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: primaryColor, // Apply primary color to the theme
        primarySwatch: generateMaterialColor(
            primaryColor), // Use custom MaterialColor for swatches
        primaryColorLight: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // Customize additional theme properties for consistency
        buttonTheme: ButtonThemeData(
          buttonColor: primaryColor,
          textTheme: ButtonTextTheme.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(),
        ),
      ),
      title: 'Flutter App',
      home: const HomeScreen(),
    );
  }
}

// A helper function to generate MaterialColor from a Color
MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(
    color.value,
    {
      50: color.withOpacity(0.1),
      100: color.withOpacity(0.2),
      200: color.withOpacity(0.3),
      300: color.withOpacity(0.4),
      400: color.withOpacity(0.5),
      500: color, // Base color
      600: color.withOpacity(0.7),
      700: color.withOpacity(0.8),
      800: color.withOpacity(0.9),
      900: color.withOpacity(1.0),
    },
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Trigger loading config on app start
    context.read<ConfigCubit>().loadConfig();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: BlocBuilder<ConfigCubit, ConfigState>(
        builder: (context, state) {
          if (state is ConfigInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ConfigLoaded) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Increment Amount: ${state.incrementAmount}',
                    style: const TextStyle(fontSize: 24),
                  ),
                  Text(
                    'Counter: ${state.counter}',
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<ConfigCubit>()
                          .incrementCounter(); // Increment the counter
                    },
                    child: const Text('Increment Counter'),
                  ),
                ],
              ),
            );
          } else if (state is ConfigError) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}
