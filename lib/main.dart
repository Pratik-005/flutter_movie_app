import 'package:flutter/material.dart';
import 'package:movie_app/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(primaryColor: Colors.green, brightness: Brightness.dark),
      home: Home(),
      builder: (context, child) {
        return SafeArea(child: child!);
      },
    );
  }
}
