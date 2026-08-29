import 'package:easy_counter/screens/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Mini Counter',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.indigo),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo.shade100,
          elevation: 0,
        ),
      ),
      home: const CounterScreen(title: 'Dynamic Mini Counter'),
    );
  }
}
