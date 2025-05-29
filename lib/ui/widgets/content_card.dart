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
    return Container(
      margin:margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? Colors.transparent,
        borderRadius:  BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            // blurRadius: 8,
            offset: Offset(0,4),
          ),
        ],
      ),
      child: child,
    );
  }
}