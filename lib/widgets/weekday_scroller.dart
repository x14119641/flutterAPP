import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekdayScroller extends StatefulWidget {
  const WeekdayScroller({super.key});

  @override
  State<WeekdayScroller> createState() => _WeekdayScrollerState();
}

class _WeekdayScrollerState extends State<WeekdayScroller> {
  final PageController _pageController = PageController(initialPage: 52); // Today in the middle
  final DateTime today = DateTime.now();
  late DateTime selectedDate;

  // static const double cellWidth = 28;

  @override
  void initState() {
    super.initState();
    selectedDate = today;
  }

  int getWeekNumber(DateTime date) {
    final thursday = date.add(Duration(days: (4 - date.weekday)));
    final firstThursday = DateTime(thursday.year, 1, 4);
    final firstWeekStart = firstThursday.subtract(
      Duration(days: firstThursday.weekday - 1),
    );
    return ((thursday.difference(firstWeekStart).inDays / 7).floor() + 1);
  }

  DateTime getStartOfWeek(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Week number
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            '📅 Week ${getWeekNumber(selectedDate)}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        const SizedBox(height: 4),

        // Static weekday names
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(7, (i) {
            final weekday = DateFormat('E').format(DateTime(2020, 1, 6 + i));
            return SizedBox(
              width: 44,
              child: Text(
                weekday,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 6),

        // Weekly pager
        SizedBox(
          height: 36,
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              setState(() {
                selectedDate = today.add(Duration(days: (index - 52) * 7));
              });
            },
            itemBuilder: (context, pageIndex) {
              final baseDate = today.add(Duration(days: (pageIndex - 52) * 7));
              final startOfWeek = getStartOfWeek(baseDate);
              final weekDates = List.generate(7, (i) => startOfWeek.add(Duration(days: i)));

              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: weekDates.map((date) {
                  final isToday = DateUtils.isSameDay(date, today);
                  final isSelected = DateUtils.isSameDay(date, selectedDate);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDate = date;
                        });
                      },
                      child: Card(
                        color: isSelected
                            ? Theme.of(context).colorScheme.primary
                            : isToday
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context).colorScheme.surface,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SizedBox(
                          width: 28,
                          height: 28,
                          child: Center(
                            child: Text(
                              DateFormat('d').format(date),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: isSelected
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}
