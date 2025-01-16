import 'package:intl/intl.dart';

extension DateStringExtension on String {
  String getDate() {
    String date = DateFormat('yyyy-MM-dd').format(DateTime.parse(this));
    return date;
  }

  String getTime() {
    String time = DateFormat('hh:mm:a').format(DateTime.parse(this));
    return time;
  }
}
