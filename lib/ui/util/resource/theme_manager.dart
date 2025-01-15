import 'package:flutter/material.dart';

import 'color/color_manager.dart';
import 'font_manager.dart';
import 'style_manager.dart';
import 'values_manager.dart';

enum ThemeApp { light, dark }

abstract class MainThemeApp {
  ThemeData getThemeData({required String fontFamily});
}

class ThemeAppManager implements MainThemeApp {
  @override
  ThemeData getThemeData({required String fontFamily}) {
    return ThemeData(
      useMaterial3: false,
      primaryColor: colorPrimary,
      // cardColor: Palette.colorCardLight,
      scaffoldBackgroundColor: colorBackgroundScaffold,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colorPrimary,
        selectionHandleColor: colorPrimary,
        selectionColor: colorSecondary.withOpacity(0.2),
      ),
      disabledColor: colorDisable,
      splashColor: colorSecondary.withOpacity(0.2),
      dialogBackgroundColor: colorBackgroundCard,

      // Text color
      // primaryColorLight: Palette.colorFontPrimaryLight,
      // primaryColorDark: Palette.colorFontSecondaryLight,

      // hintColor: Palette.colorPlaceHolderLight,
      //
      // shadowColor: Palette.colorBackgroundDark,
      fontFamily: fontFamily,

      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),

      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colorPrimary,
        circularTrackColor: colorSecondary.withOpacity(0.2),
      ),

      colorScheme: ColorScheme.fromSwatch(
        accentColor: colorPrimary, // but now it should be declared like this
        backgroundColor: colorBackgroundCard,
        primarySwatch: primarySwatch,
        errorColor: colorError,
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorBackgroundCard,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: colorPrimary,
        unselectedItemColor: colorSecondary,
        selectedLabelStyle: Styles.getRegularStyle(
          fontSize: FontSize.s12,
          color: colorPrimary,
        ),
        unselectedLabelStyle: Styles.getRegularStyle(
          fontSize: FontSize.s12,
          color: colorSecondary,
        ),
      ),

      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorBackgroundCard,
        modalBackgroundColor: colorBackgroundCard,
        dragHandleColor: colorSecondary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSize.s16),
          ),
        ),
      ),

      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: colorPrimary,
        iconTheme: IconThemeData(color: colorOnPrimary, size: AppSize.s24),
        actionsIconTheme: IconThemeData(color: colorOnPrimary, size: AppSize.s24),
        titleSpacing: AppPadding.p16,
        titleTextStyle: Styles.getSemiBoldStyle(
          color: colorOnPrimary,
          fontSize: FontSize.s16,
        ).copyWith(fontFamily: fontFamily),
      ),

      // sliderTheme: const SliderThemeData(
      //   thumbColor: ColorManager.colorPrimary,
      //   thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
      //   activeTrackColor: ColorManager.colorPrimary,
      //   inactiveTrackColor: ColorManager.colorWhite1,
      //   trackHeight: AppSize.s5,
      //   overlayColor: ColorManager.colorPrimary1,
      //   inactiveTickMarkColor: ColorManager.colorGray1,
      //   disabledInactiveTickMarkColor: ColorManager.colorGray1,
      // ),
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ElevatedButton.styleFrom(
      //     minimumSize: const Size(double.infinity, 48),
      //     elevation: 0,
      //     backgroundColor: ColorManager.colorPrimary,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(8),
      //     ),
      //   ),
      // ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          elevation: 0,
          foregroundColor: colorSecondary,
        ),
      ),

      // tab bar theme
      // tabBarTheme: TabBarTheme(
      //   labelColor: ColorManager.colorWhite,
      //   unselectedLabelColor: ColorManager.colorGray9,
      //   labelStyle: StyleManager.getSemiBoldStyle(
      //     color: ColorManager.colorWhite,
      //   ).copyWith(fontFamily: fontFamily),
      //   unselectedLabelStyle: StyleManager.getSemiBoldStyle(
      //     color: ColorManager.colorGray9,
      //   ).copyWith(fontFamily: fontFamily),
      //   indicator: const BoxDecoration(
      //     color: ColorManager.colorPrimary,
      //     borderRadius: BorderRadiusDirectional.all(
      //       Radius.circular(AppSize.s8),
      //     ),
      //   ),
      // ),

      // input decoration theme (text form field)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorBackgroundCard,
        contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p8),

        // hint style
        hintStyle: Styles.getRegularStyle(
          color: colorHintText,
        ),

        // labelStyle: Styles.getRegularStyle(color: Palette.black4, fontSize: FontSize.s14),
        // error style
        errorStyle: Styles.getRegularStyle(
          color: colorError,
          fontSize: FontSize.s12,
        ),

        // helper style
        helperStyle: Styles.getRegularStyle(
          color: colorOnError,
          fontSize: FontSize.s12,
        ),

        // enabled border style
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorBorderTextField, width: AppSize.s1),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),

        // disable border style
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorBorderTextField, width: AppSize.s1),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),

        // focused border style
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorPrimary, width: AppSize.s1),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
        ),

        // error border style
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorError, width: AppSize.s1),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorError, width: AppSize.s1),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
      ),
    );
  }
}
