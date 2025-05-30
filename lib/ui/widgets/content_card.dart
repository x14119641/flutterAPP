import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Color? color;

  const ContentCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.margin = const EdgeInsets.symmetric(vertical: 8),
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Card(
        color: color ?? Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}
