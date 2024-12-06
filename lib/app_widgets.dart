import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final Color primaryColor;

  const MyApp({super.key, required this.primaryColor});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: Theme.of(context),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Trigger loading config on app start
    // context.read<ConfigCubit>().loadConfig();

    return const Scaffold(
        //   appBar: AppBar(
        //     title: Text('Home Screen'),
        //   ),
        //   body: BlocBuilder<ConfigCubit, ConfigState>(
        //     builder: (context, state) {
        //       if (state is ConfigInitial) {
        //         return Center(child: CircularProgressIndicator());
        //       } else if (state is ConfigLoaded) {
        //         return Center(
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Text('Increment Amount: ${state.incrementAmount}'),
        //               Text('Secret Key: ${state.secretKey}'),
        //             ],
        //           ),
        //         );
        //       } else if (state is ConfigError) {
        //         return Center(child: Text('Error: ${state.error}'));
        //       }
        //       return Container(); // Default state
        //     },
        //   ),
        );
  }
}
