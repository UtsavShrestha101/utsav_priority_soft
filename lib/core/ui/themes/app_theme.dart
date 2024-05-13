import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/resources/fonts.gen.dart';

// app theme
class AppTheme {
  static ThemeData get light => ThemeData(
        brightness: Brightness.light,
        fontFamily: FontFamily.priority,
        appBarTheme: _appBarTheme,
        bottomSheetTheme: _bottomSheetTheme,
      );

  static get _appBarTheme => const AppBarTheme(elevation: 0);

  static get _bottomSheetTheme => BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.sp),
            topRight: Radius.circular(20.sp),
          ),
        ),
      );
}
