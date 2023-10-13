import 'package:error_handler/presentation/util/resources/color_manager.dart';
import 'package:flutter/material.dart';

import 'font_manager.dart';
import 'style_manager.dart';
import 'values_manager.dart';

abstract class MainThemeApp {
  late ThemeData themeData;
}

class LightModeTheme implements MainThemeApp {
  @override
  ThemeData themeData = ThemeData(
    primaryColor: ColorManager.colorPrimaryLight,
    cardColor: ColorManager.colorCardLight,
    scaffoldBackgroundColor: ColorManager.colorBackgroundLight,
    disabledColor: ColorManager.colorGrey1,
    splashColor: ColorManager.colorSplash,

    // Text color
    primaryColorLight: ColorManager.colorFontPrimaryLight,
    primaryColorDark: ColorManager.colorFontSecondaryLight,

    hintColor: ColorManager.colorPlaceHolderLight,

    shadowColor: ColorManager.colorBackgroundDark,

    fontFamily: FontConstants.fontDMSans,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.colorBackgroundLight,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorManager.colorPrimaryLight,
      unselectedItemColor: ColorManager.colorBlack,
    ),

    appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: ColorManager.colorFontPrimaryLight, size: AppSize.s20),
        titleTextStyle: getMediumStyle(
            fontSize: FontSize.s18, color: ColorManager.colorFontPrimaryLight)),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorManager.colorTextFieldLight,
        contentPadding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p16, vertical: AppPadding.p20),
        // hint style
        hintStyle: getRegularStyle(color: ColorManager.colorPlaceHolderLight),
        labelStyle: getMediumStyle(color: ColorManager.colorFontPrimaryLight),
        errorStyle: getRegularStyle(color: ColorManager.colorError),

        // enabled border style
        enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.transparent, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s10))),

        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorManager.colorPrimaryLight, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10))),

        // error border style
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.colorError, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10))),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorManager.colorPrimaryLight, width: AppSize.s1_5),
            borderRadius:
                const BorderRadius.all(Radius.circular(AppSize.s10)))),
  );
}

class DarkModeTheme implements MainThemeApp {
  @override
  ThemeData themeData = ThemeData(
    primaryColor: ColorManager.colorPrimaryDark,
    cardColor: ColorManager.colorCardDark,
    scaffoldBackgroundColor: ColorManager.colorBackgroundDark,
    disabledColor: ColorManager.colorGrey1,

    // input decoration theme (text form field)
    // inputDecorationTheme: InputDecorationTheme(
    //   // content padding
    //     contentPadding: const EdgeInsets.all(AppPadding.p8),
    //     // hint style
    //     hintStyle: getRegularStyle(
    //         color: ColorManager.colorPlaceHolderLight, fontSize: FontSize.s14),
    //     labelStyle:
    //     getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
    //     errorStyle: getRegularStyle(color: ColorManager.error),
    //
    //     // enabled border style
    //     enabledBorder: OutlineInputBorder(
    //         borderSide:
    //         BorderSide(color: ColorManager.colorGrey2, width: AppSize.s1_5),
    //         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
    //
    //     // focused border style
    //     focusedBorder: OutlineInputBorder(
    //         borderSide:
    //         BorderSide(
    //             color: ColorManager.colorPrimaryLight, width: AppSize.s1_5),
    //         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
    //
    //     // error border style
    //     errorBorder: OutlineInputBorder(
    //         borderSide:
    //         BorderSide(color: ColorManager.colorError, width: AppSize.s1_5),
    //         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
    //     // focused border style
    //     focusedErrorBorder: OutlineInputBorder(
    //         borderSide:
    //         BorderSide(
    //             color: ColorManager.colorPrimaryLight, width: AppSize.s1_5),
    //         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),
  );
}

// ThemeData getApplicationTheme() {
//   return ThemeData(
//     // main colors
//     primaryColor: ColorManager.primary,
//     primaryColorLight: ColorManager.lightPrimary,
//     primaryColorDark: ColorManager.darkPrimary,
//     disabledColor: ColorManager.grey1,
//     splashColor: ColorManager.lightPrimary,
//     // fontFamily: FontConstants.fontFamily,
//
//     // cardView theme
//     cardTheme: CardTheme(
//         color: ColorManager.white,
//         shadowColor: ColorManager.grey,
//         elevation: AppSize.s4),
//
//     // appBar theme
//     appBarTheme: AppBarTheme(
//         centerTitle: true,
//         color: ColorManager.primary,
//         elevation: AppSize.s4,
//         shadowColor: ColorManager.lightPrimary,
//         titleTextStyle: getRegularStyle(fontSize: FontSize.s16, color: ColorManager.white)),
//
//     // button theme
//     buttonTheme: ButtonThemeData(
//         shape: const StadiumBorder(),
//         disabledColor: ColorManager.grey1,
//         buttonColor: ColorManager.primary,
//         splashColor: ColorManager.lightPrimary),
//
//     // elevated button them
//     elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//             textStyle: getRegularStyle(color: ColorManager.white, fontSize: FontSize.s17),
//             primary: ColorManager.primary,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(AppSize.s12)))),
//
//     // text button them
//     textButtonTheme: TextButtonThemeData(
//         style: TextButton.styleFrom(
//             textStyle: getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s16),
//             primary: ColorManager.primary,
//             // splashFactory: NoSplash.splashFactory
//         )
//     ),
//
//     // text theme
//     textTheme: TextTheme(
//         displayLarge: getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
//         headlineLarge: getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
//         headlineMedium: getRegularStyle(color: ColorManager.darkGrey, fontSize: FontSize.s14),
//         titleMedium: getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s16),
//         titleSmall: getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
//         bodyLarge: getRegularStyle(color: ColorManager.grey1),
//         bodySmall: getRegularStyle(color: ColorManager.grey),
//         bodyMedium: getRegularStyle(color: ColorManager.grey2, fontSize: FontSize.s12),
//         labelSmall: getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s12)),
//
//     // input decoration theme (text form field)
//     inputDecorationTheme: InputDecorationTheme(
//         // content padding
//         contentPadding: const EdgeInsets.all(AppPadding.p8),
//         // hint style
//         hintStyle: getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
//         labelStyle:
//             getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
//         errorStyle: getRegularStyle(color: ColorManager.error),
//
//         // enabled border style
//         enabledBorder: OutlineInputBorder(
//             borderSide:
//                 BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
//             borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
//
//         // focused border style
//         focusedBorder: OutlineInputBorder(
//             borderSide:
//                 BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
//             borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
//
//         // error border style
//         errorBorder: OutlineInputBorder(
//             borderSide:
//                 BorderSide(color: ColorManager.error, width: AppSize.s1_5),
//             borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
//         // focused border style
//         focusedErrorBorder: OutlineInputBorder(
//             borderSide:
//                 BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
//             borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),
//     // label style
//   );
// }
//

// enum AppTheme {
//   Light,
//   Dark
//   // GreenLight,
//   // GreenDark,
//   // BlueLight,
//   // BlueDark,
// }
