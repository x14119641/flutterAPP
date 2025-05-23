import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Appr Name',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>  const HomePage(),
      },
    );
  }
}
