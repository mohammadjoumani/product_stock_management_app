// import 'package:flutter/material.dart';
//
// import 'custom_text_field.dart';
// import 'generic_date_picker_dialog.dart';
//
// class CustomTextFieldDate extends StatelessWidget {
//   const CustomTextFieldDate({
//     super.key,
//     required this.hintText,
//     required this.firstDate,
//     required this.lastDate,
//     required this.controller,
//     required this.returnDate,
//     this.errorText,
//     this.helperText,
//   });
//
//   final String hintText;
//   final DateTime firstDate;
//   final DateTime lastDate;
//   final TextEditingController controller;
//   final Function(String) returnDate;
//   final String? errorText;
//   final String? helperText;
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomTextField(
//       controller: controller,
//       hintText: hintText,
//       readOnly: true,
//       onTap: () {
//         showDialog(
//           context: context,
//           builder: (_) => GenericDatePickerDialog(
//             initDate: (controller.text).isEmpty ? DateTime.now() : DateTime.parse(controller.text),
//             returnDate: (date) {
//               controller.text = date;
//               returnDate(date);
//             },
//             firstDate: firstDate,
//             lastDate: lastDate,
//           ),
//         );
//       },
//       helperText: helperText,
//       errorText: errorText,
//     );
//   }
// }
