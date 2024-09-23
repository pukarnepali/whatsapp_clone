import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp/common/extension/custom_theme_extension.dart';
import 'package:whatsapp/common/utils/colors.dart';

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    dialogBackgroundColor: Coloors.backgroundDark,
    scaffoldBackgroundColor: Coloors.backgroundDark,
    extensions: [
      CustomThemeExtension.DarkMode,
    ],
    appBarTheme: const AppBarTheme(
      backgroundColor: Coloors.greyBackground,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Coloors.greyDark,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
    ),
    iconTheme: const IconThemeData(color: Coloors.greyDark),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: Coloors.greenDark,
          foregroundColor: Coloors.backgroundDark,
          splashFactory: NoSplash.splashFactory,
          elevation: 0,
          shadowColor: Colors.transparent),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Coloors.greyBackground,
      modalBackgroundColor: Coloors.greyBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Coloors.greyBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: Coloors.greenDark,
      tileColor: Coloors.backgroundDark,
    ),
  );
}
