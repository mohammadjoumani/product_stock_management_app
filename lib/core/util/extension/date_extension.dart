// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// extension Date on DateTime {
//   // String getNameDay() {
//   //   final local = _appPref.getAppLanguage();
//   //   return DateFormat('EEEE', local).format(this);
//   // }
//
//   // String getTime() {
//   //   final local = _appPref.getAppLanguage();
//   //   final time = DateFormat('hh:mm').format(this);
//   //   final period = DateFormat('a', local).format(this);
//   //   return '$time $period';
//   // }
// }
//
// extension Time on TimeOfDay {
//   String getTime() {
//     final isArabic = _appPref.getAppLanguage() == 'ar';
//     final hour = hourOfPeriod == 0 ? 12 : hourOfPeriod.toString().padLeft(2, '0');
//     final minute = this.minute.toString().padLeft(2, '0');
//
//     String period;
//     if (isArabic) {
//       period = this.period == DayPeriod.am ? 'ص' : 'م';
//     } else {
//       period = this.period == DayPeriod.am ? 'AM' : 'PM';
//     }
//
//     return '$hour:$minute $period';
//   }
// }
//
// extension DateStringExtension on String {
//   String getDateWithTime() {
//     final local = _appPref.getAppLanguage();
//     String date = DateFormat('yyyy-MM-dd').format(DateTime.parse(this));
//     String time = DateFormat('hh:mm').format(DateTime.parse(this));
//     String period = DateFormat('a', local).format(DateTime.parse(this));
//     return '$date $time $period';
//   }
//
//   String getDate() {
//     String date = DateFormat('yyyy-MM-dd').format(DateTime.parse(this));
//     return date;
//   }
//
//   String getDate1() {
//     String date = DateFormat('yyyy/MM/dd').format(DateTime.parse(this));
//     return date;
//   }
//
//   String getTime() {
//     final local = _appPref.getAppLanguage();
//     String time = DateFormat('hh:mm').format(DateTime.parse(this));
//     String period = DateFormat('a', local).format(DateTime.parse(this));
//     return '$time $period';
//   }
//
//   String getTime1() {
//     String date = DateFormat.jm().format(DateTime.parse(this));
//     return date;
//   }
//
//   String getDateWithDayName() {
//     String date = DateFormat().add_yMMMMEEEEd().format(DateTime.parse(this));
//     return date;
//   }
//
//   num getAge() {
//     final today = DateTime.now();
//     final birthDate = DateTime.parse(this);
//     int age = today.year - birthDate.year;
//     int month = today.month - birthDate.month;
//     if (month < 0 || (month == 0 && today.day < birthDate.day)) {
//       age--;
//     }
//     return age;
//   }
// }
