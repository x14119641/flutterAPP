import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/store/date_store.dart';

class MainContentInfo extends StatelessWidget {
  const MainContentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedDate = context.watch<DateStore>().selectedDate;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '🗓️ Selected Date:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          DateFormat('EEEE, MMMM d, yyyy').format(selectedDate),
          style: const TextStyle(fontSize: 15),
        ),
        Text(
          'BLABLABLALBLABLALBLALBALBLALBLALBALBLALBALBLALBALBLALBALBLALBALBLALBLALBALBLALBALBLBLA',
          style: const TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
