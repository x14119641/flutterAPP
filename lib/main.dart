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
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFF0EAD2),
          onPrimary: Color(0xFF6C584C),
          secondary: Color(0xFFA98467),
          onSecondary: Colors.white, // text colors
          surface: Color(0xFFDDE5B6),
          onSurface: Color(0xFF6C584C),
          error: Colors.red,
          onError: Colors.white,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: Color(0xFFF0EAD2),
      ),
      initialRoute: '/',
      routes: {'/': (context) => const HomePage()},
    );
  }
}
