import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'app_drawer.dart';


class BaseLayout extends StatelessWidget {
  final String title;
  final Widget child;

  const BaseLayout({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: CustomAppBar(title: title),
      drawer: const AppDrawer(),
      body: Padding(padding: const EdgeInsets.all(8.0), child: child,),
    );
  }
}