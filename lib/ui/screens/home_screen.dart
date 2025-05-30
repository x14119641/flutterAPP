import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/widgets/base_layout.dart';
import 'package:flutter_application_1/ui/widgets/content_card.dart';
import 'package:flutter_application_1/ui/widgets/main_content_info.dart';
import 'package:flutter_application_1/ui/widgets/weekday_scroller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: 'Home',
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContentCard(child: WeekdayScroller()),
            ContentCard(child: MainContentInfo()),
            ContentCard(child: Placeholder(fallbackHeight: 120,)),
            ContentCard(child: Placeholder(fallbackHeight: 120,)),
          ],
        ),
      ),
    );
  }
}
