import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekdayScroller extends StatelessWidget {
  WeekdayScroller({super.key});

  final DateTime today = DateTime.now();

  /// Returns Monday of the current week
  DateTime getStartOfWeek(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  /// Gwenerates 7 dates starting from Monday
  List<DateTime> getCurrentWeekDates() {
    DateTime start = getStartOfWeek(today);
    return List.generate(7, (index) => start.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    final weekDates = getCurrentWeekDates();
    final dayFormatter = DateFormat('E'); // Mon, tue...
    final dateFormatter = DateFormat('d');

    return SizedBox(
      height: 100,
      child: ListView.separated(
        itemBuilder: (context, index) {
          final date = weekDates[index];
          final isToday = DateUtils.isSameDay(date, today);
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isToday
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18, right: 8),
                      child: Text(
                        dateFormatter.format(date),
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      dayFormatter.format(date),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ],
                ),
                // ticker
                const SizedBox(height: 4),
                date.weekday == DateTime.thursday
                    ? Icon(
                        Icons.check,
                        size: 16,
                        color: Theme.of(context).colorScheme.onSecondary,
                      )
                    : const SizedBox(height: 16),
              ],
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemCount: weekDates.length,
        padding: const EdgeInsets.symmetric(horizontal: 12),
      ),
    );
  }
}
