import 'package:intl/intl.dart';

// fetching today from system
String fetchToday() {
  final now = DateTime.now();
  String formatter = DateFormat('EEEE').format(now);
  return formatter;
}

// fetching current time from system
String fetchTime() {
  final now = DateFormat('hh:mm a').format(DateTime.now());
  return now;
}
