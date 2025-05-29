// lib/app/app.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/app/providers.dart';
import 'package:flutter_application_1/ui/screens/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      child: MaterialApp(
        title: 'Your App Name',
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: Color(0xFFF0EAD2),
            onPrimary: Color(0xFF6C584C),
            secondary: Color(0xFFA98467),
            onSecondary: Colors.white,
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
      ),
    );
  }
}
