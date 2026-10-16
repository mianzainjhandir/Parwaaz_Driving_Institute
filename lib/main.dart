import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parwaz/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Parwaaz Driving Institute',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0B2545)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
