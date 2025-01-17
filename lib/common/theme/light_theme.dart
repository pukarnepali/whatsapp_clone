import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp/common/extension/custom_theme_extension.dart';
import 'package:whatsapp/common/utils/colors.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      dialogBackgroundColor: Coloors.backgroundLight,
      scaffoldBackgroundColor: Coloors.backgroundLight,
      extensions: [
        CustomThemeExtension.lightMode,
      ],
      appBarTheme: const AppBarTheme(
          backgroundColor: Coloors.greyBackground,
          titleTextStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Coloors.greenDark),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark),
          iconTheme: IconThemeData(color: Coloors.greyDark)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Coloors.greenLight,
            foregroundColor: Coloors.backgroundLight,
            splashFactory: NoSplash.splashFactory,
            elevation: 0,
            shadowColor: Colors.transparent),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Coloors.backgroundLight,
        modalBackgroundColor: Coloors.backgroundLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: Coloors.backgroundLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: Coloors.greenDark,
        tileColor: Coloors.backgroundLight,
      ));
}
