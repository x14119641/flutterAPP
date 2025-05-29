import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/base_layout.dart';
import 'package:flutter_application_1/widgets/content_card.dart';
import 'package:flutter_application_1/widgets/weekday_scroller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: 'Home',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContentCard(child: WeekdayScroller(),
          ),
        ],
      ),
    );
  }
}