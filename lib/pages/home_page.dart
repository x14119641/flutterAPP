import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/base_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: 'Home',
      child: Text("Welcome to Home Page"),
    );
  }
}