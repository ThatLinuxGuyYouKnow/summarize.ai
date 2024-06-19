import 'package:flutter/material.dart';

class SummaryNotifier extends ChangeNotifier {
  bool summaryIsAvailable = false;

  void alertSummaryIsAvailable() {
    summaryIsAvailable = true;
    notifyListeners();
  }
}
