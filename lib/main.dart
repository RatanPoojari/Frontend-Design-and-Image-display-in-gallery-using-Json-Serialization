import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(context) {
    return MaterialApp(
      title: 'Weddings',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 157, 248, 227),
        appBar: AppBar(
          title: const Text(
            'Your Special Moments!',
          ),
          centerTitle: true,
        ),
      ),
    );
  }
}
