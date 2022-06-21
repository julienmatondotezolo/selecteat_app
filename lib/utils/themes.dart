import 'package:flutter/material.dart';
import 'package:selecteat_app/utils/constants.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    fontFamily: 'Montreal',
    bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.transparent),
    scaffoldBackgroundColor: brandDarkColor,
  );

  static final lighTheme = ThemeData(
    fontFamily: 'Montreal',
    bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.transparent),
    scaffoldBackgroundColor: Colors.white
  );
}
