// import 'package:flutter/material.dart';
// import 'package:product_stock_management_app/ui/util/resource/color/color_manager.dart';
// import 'package:product_stock_management_app/ui/util/resource/font_manager.dart';
// import 'package:product_stock_management_app/ui/util/resource/style_manager.dart';
// import 'package:product_stock_management_app/ui/util/resource/values_manager.dart';
//
// import 'margin.dart';
//
// class ChangeLanguageButton extends StatelessWidget {
//   const ChangeLanguageButton({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () => _onPressedChangeLanguageButton(context),
//       child: Row(
//         children: [
//           // Icon
//           const Icon(
//             Icons.language,
//             color: ColorManager.colorWhite,
//             size: AppSize.s20,
//           ),
//
//           // Spacer
//           const Sw1(),
//
//           Text(
//             'Language',
//             textAlign: TextAlign.center,
//             style: Styles.getMediumStyle(color: ColorManager.colorWhite).copyWith(
//               fontFamily: FontConstants.fontLato,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   _onPressedChangeLanguageButton(BuildContext context) {
//     showLanguageBottomSheet(context);
//   }
// }
//
// class LanguagesBottomSheet extends StatelessWidget {
//   const LanguagesBottomSheet({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           ListTile(
//             title: Text(
//               'العربية',
//               style: Styles.getRegularStyle(color: ColorManager.colorBlack1).copyWith(
//                 fontFamily: FontConstants.fontCairo,
//               ),
//             ),
//             onTap: () {
//               // BlocProvider.of<MainBloc>(context).add(ChangeLanguageToArabic());
//               Navigator.pop(context);
//             },
//             // trailing: context.read<MainBloc>().state.locale == arabicLocale ? const Icon(Icons.check, color: ColorManager.colorPrimary) : const SizedBox(),
//           ),
//           ListTile(
//             title: Text(
//               'English',
//               style: Styles.getRegularStyle(color: ColorManager.colorBlack1).copyWith(
//                 fontFamily: FontConstants.fontLato,
//               ),
//             ),
//             onTap: () {
//               // BlocProvider.of<MainBloc>(context).add(ChangeLanguageToEnglish());
//               Navigator.pop(context);
//             },
//             // trailing: context.read<MainBloc>().state.locale == englishLocale ? const Icon(Icons.check, color: ColorManager.colorPrimary) : const SizedBox(),
//           ),
//           const Sh4(),
//         ],
//       ),
//     );
//   }
// }
//
// showLanguageBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     showDragHandle: true,
//     enableDrag: true,
//     useSafeArea: true,
//     builder: (_) => const LanguagesBottomSheet(),
//   );
// }
