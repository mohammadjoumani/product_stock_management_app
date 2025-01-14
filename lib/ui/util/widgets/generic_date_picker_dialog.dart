// import 'package:flutter/material.dart';
// import 'package:product_stock_management_app/ui/util/resource/color/color_manager.dart';
// import 'package:product_stock_management_app/ui/util/resource/values_manager.dart';
//
// import 'custom_button.dart';
//
// class GenericDatePickerDialog extends StatefulWidget {
//   GenericDatePickerDialog({
//     super.key,
//     required this.initDate,
//     required this.returnDate,
//     this.firstDate,
//     this.lastDate,
//   });
//
//   final DateTime? firstDate;
//   final DateTime? lastDate;
//   DateTime initDate;
//   final Function(String) returnDate;
//
//   @override
//   State<GenericDatePickerDialog> createState() => _GenericDatePickerDialogState();
// }
//
// class _GenericDatePickerDialogState extends State<GenericDatePickerDialog> {
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: ColorManager.colorBackground,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(AppSize.s8),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(AppPadding.p16),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // Calendar Date Picker
//             Theme(
//               data: Theme.of(context).copyWith(
//                 colorScheme: const ColorScheme.light(
//                   primary: ColorManager.colorPrimary,
//                 ),
//               ),
//               child: CalendarDatePicker(
//                 initialDate: widget.initDate,
//                 firstDate: widget.firstDate ?? DateTime(1900),
//                 lastDate: widget.lastDate ?? DateTime.now(),
//                 onDateChanged: (date) {
//                   setState(() {
//                     widget.initDate = date;
//                   });
//                 },
//               ),
//             ),
//
//             //Buttons
//             Row(
//               children: [
//                 Expanded(
//                   child: CustomButton(
//                     label: "AppStrings.strCancel.tr(context)",
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     buttonType: ButtonType.outline,
//                     buttonSize: ButtonSize.small,
//                   ),
//                 ),
//                 const SizedBox(width: AppSize.s8),
//                 Expanded(
//                   child: CustomButton(
//                     label: "AppStrings.strConfirm.tr(context)",
//                     onPressed: () {
//                       Navigator.pop(context);
//                       // returnDate(dateTime);
//                       // returnDate("${dateTime.year}-${dateTime.month}-${dateTime.day}");
//                       widget.returnDate(widget.initDate.toString().split(" ")[0]);
//                     },
//                     buttonType: ButtonType.solid,
//                     buttonSize: ButtonSize.small,
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
