import 'package:flutter/foundation.dart';

class DateStore extends ChangeNotifier {
  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void setDate(DateTime newDate) {
    _selectedDate = newDate;
    notifyListeners();
  }
} 