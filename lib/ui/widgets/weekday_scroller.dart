import 'package:flutter/material.dart';
import 'package:flutter_application_1/store/date_store.dart';
import 'package:flutter_application_1/ui/screens/full_calendar_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class WeekdayScroller extends StatefulWidget {
  const WeekdayScroller({super.key});

  @override
  State<WeekdayScroller> createState() => _WeekdayScrollerState();
}

class _WeekdayScrollerState extends State<WeekdayScroller> {
  final PageController _pageController = PageController(initialPage: 52);
  final DateTime today = DateTime.now();

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
    final dateStore = Provider.of<DateStore>(context);
    final selectedDate = dateStore.selectedDate;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Week number
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Week ${getWeekNumber(selectedDate)}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullCalendarScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.calendar_today),
                tooltip: 'Open Calendar',
              ),
            ],
          ),
        ),
        // const SizedBox(height: 4),

        // Static weekday names
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(7, (i) {
            final weekday = DateFormat('E').format(DateTime(2020, 1, 6 + i));
            return SizedBox(
              width: 40,
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
        // const SizedBox(height: 2),

        // Weekly pager
        SizedBox(
          height: 40,
          width: double.infinity,
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              final newDate = today.add(Duration(days: (index - 52) * 7));
              dateStore.setDate(newDate);
            },
            itemBuilder: (context, pageIndex) {
              final baseDate = today.add(Duration(days: (pageIndex - 52) * 7));
              final startOfWeek = getStartOfWeek(baseDate);
              final weekDates = List.generate(
                7,
                (i) => startOfWeek.add(Duration(days: i)),
              );

              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 360),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: weekDates.map((date) {
                      final isToday = DateUtils.isSameDay(date, DateTime.now());
                      final isSelected =
                          date == context.watch<DateStore>().selectedDate;

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: GestureDetector(
                          onTap: () => dateStore.setDate(date),
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
                                        ? Theme.of(
                                            context,
                                          ).colorScheme.onPrimary
                                        : Theme.of(
                                            context,
                                          ).colorScheme.onSurface,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
