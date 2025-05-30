import 'package:flutter/material.dart';
import 'package:flutter_application_1/store/date_store.dart';
import 'package:provider/provider.dart';

class FullCalendarScreen extends StatelessWidget {
  const FullCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dateStore = Provider.of<DateStore>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Select a Date')),
      body: CalendarDatePicker(
        initialDate: dateStore.selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        onDateChanged: (newDate) {
          dateStore.setDate(newDate);
          Navigator.pop(context); // go back
        },
      ),
    );
  }
}
