import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Constants.dart';
import 'widget/my_colors.dart';
import 'widget/my_text.dart';

import 'package:get/get.dart';

class AppThemes {
  static const int LightBlue = 0;
  static const int LightRed = 1;
  static const int DarkBlue = 2;
  static const int DarkRed = 3;
  static const int test1 = 4;
  static const int test2 = 5;

  static String toStr(int themeId) {
    switch (themeId) {
      case LightBlue:
        return "الوضع الأفتراضي للنظام";
      case test1:
        return "فاتح";
      case test2:
        return "الوضع الليلي";
      default:
        return "Unknown";
    }
  }

  static ThemeData toStr2(int themeId) {
    switch (themeId) {
      case LightBlue:
        return _buildThemeTest1();
      case LightRed:
        return _buildShrineTheme();
      case DarkBlue:
        return ThemeData(useMaterial3: true, colorScheme: ColorScheme.light(primary: Colors.red));
      case DarkRed:
        return ThemeData(useMaterial3: true, colorScheme: ColorScheme.dark(primary: Colors.red, secondary: Colors.red));
      case test1:
        return _buildThemeTest1();
      case test2:
        return _buildThemeTest2();
      default:
        return ThemeData(useMaterial3: true, colorScheme: ColorScheme.light(primary: Colors.brown));
    }
  }
}

ThemeData _buildThemeTest1() {
  final ThemeData base = ThemeData.light(useMaterial3: true);
  return base.copyWith(
    colorScheme: _test1ColorScheme,
    primaryColor: test1_color1_100,
    scaffoldBackgroundColor: test1_colorBackgroundWhite,
    cardColor: test1_colorBackgroundWhite,
    // errorColor is now in colorScheme
    buttonTheme: const ButtonThemeData(
      colorScheme: _test1ColorScheme,
    ),
    primaryIconTheme: _customIconThemeTest1(base.iconTheme),
    textTheme: _buildTest1TextTheme(base.textTheme),
    primaryTextTheme: _buildTest1TextTheme(base.primaryTextTheme),
    iconTheme: _customIconThemeTest1(base.iconTheme),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: kColorsWhite,
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: test1_colorSurfaceWhite),
      backgroundColor: test1_color1_100, // صحيح في AppBarTheme
      titleTextStyle: TextStyle(
        fontSize: 16.0.sp,
        color: test1_colorSurfaceWhite,
      ),
    ),
  );
}

TextTheme _buildTest1TextTheme(TextTheme base) {
  return base.copyWith(
    headlineSmall: TextStyle(
        fontSize: 16.0.sp,
        color: kColorsLightBlack
    ),
    headlineMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black),
    displaySmall: TextStyle(
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w500,
        color: kColorsLightBlack),
    displayLarge: TextStyle(
        fontSize: 20.0.sp,
        fontWeight: FontWeight.bold,
        color: kColorsBlack),
    displayMedium: TextStyle(
        fontSize: 18.0.sp,
        fontWeight: FontWeight.w300,
        color: Colors.black),
    titleLarge: TextStyle(
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black),
    bodyMedium: TextStyle(fontSize: 14.0.sp, color: kColorsBlack),
    bodyLarge: TextStyle(fontSize: 12.0.sp, color: kColorsBlack, fontWeight: FontWeight.w300,),
    bodySmall: TextStyle(fontSize: 10.0.sp, color: Colors.grey, fontWeight: FontWeight.w300,),
  ).apply(
    fontFamily: 'ArbFONTS-DINNextLTArabic',
    displayColor: test1_color2_900,
    bodyColor: test1_color2_900,
  );
}

IconThemeData _customIconThemeTest1(IconThemeData original) {
  return original.copyWith(color: test1_color2_900);
}

const ColorScheme _test1ColorScheme = ColorScheme(
  primary: test1_color1_100,
  primaryContainer: test1_color2_900,
  secondary: test1_color1_50,
  secondaryContainer: test1_color2_900,
  surface: test1_colorSurfaceWhite,
  background: test1_colorBackgroundWhite,
  error: test1_color_ErrorRed, // errorColor هنا بدلاً من
  onPrimary: test1_color2_900,
  onSecondary: test1_color2_900,
  onSurface: test1_color2_900,
  onBackground: test1_color2_900,
  onError: test1_colorSurfaceWhite,
  brightness: Brightness.light,
);

const Color test1_color1_50 = Color(0xFF158BAC);
const Color test1_color1_100 = Color(0xFF158BA4);
const Color test1_color1_300 = Color(0xFF036E92);
const Color test1_color1_400 = Color(0xFF005163);

const Color test1_color2_900 = Color(0xFF442B2D);
const Color test1_color2_600 = Color(0xFF7D4F52);

const Color test1_color_ErrorRed = Color(0xFFC5032B);

const Color test1_colorSurfaceWhite = Color(0xF5EEF1F8);
const Color test1_colorBackgroundWhite = Color(0xF5EEF1F8);

ThemeData _buildThemeTest2() {
  final ThemeData base = ThemeData.dark(useMaterial3: true);
  return base.copyWith(
    colorScheme: _test2ColorScheme,
    primaryColor: test2_color1_100,
    scaffoldBackgroundColor: test2_colorBackgroundWhite,
    cardColor: test2_colorBackgroundWhite,
    // errorColor is now in colorScheme
    buttonTheme: const ButtonThemeData(
      colorScheme: _test2ColorScheme,
    ),
    primaryIconTheme: _customIconThemeTest2(base.iconTheme),
    textTheme: _buildTest2TextTheme(base.textTheme),
    primaryTextTheme: _buildTest2TextTheme(base.primaryTextTheme),
    iconTheme: _customIconThemeTest2(base.iconTheme),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: kColorsWhite,
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: test2_colorSurfaceWhite),
      backgroundColor: test2_color1_100, // صحيح في AppBarTheme
      titleTextStyle: TextStyle(
        fontSize: 16.0.sp,
        color: test2_colorSurfaceWhite,
      ),
    ),
  );
}

TextTheme _buildTest2TextTheme(TextTheme base) {
  return base.copyWith(
    headlineSmall: TextStyle(
        fontSize: 16.0.sp,
        color: kColorsLightBlack
    ),
    headlineMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: Colors.white),
    displaySmall: TextStyle(
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w500,
        color: kColorsLightBlack),
    displayLarge: TextStyle(
        fontSize: 20.0.sp,
        fontWeight: FontWeight.bold,
        color: kColorsBlack),
    displayMedium: TextStyle(
        fontSize: 18.0.sp,
        fontWeight: FontWeight.w300,
        color: Colors.white),
    titleLarge: TextStyle(
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w500,
        color: Colors.white),
    bodyMedium: TextStyle(fontSize: 14.0.sp, color: kColorsBlack),
    bodyLarge: TextStyle(fontSize: 12.0.sp, color: kColorsBlack, fontWeight: FontWeight.w300,),
    bodySmall: TextStyle(fontSize: 10.0.sp, color: Colors.grey, fontWeight: FontWeight.w300,),
  ).apply(
    fontFamily: 'ArbFONTS-DINNextLTArabic',
    displayColor: test2_color2_900,
    bodyColor: test2_color2_900,
  );
}

IconThemeData _customIconThemeTest2(IconThemeData original) {
  return original.copyWith(color: test2_color2_900);
}

const ColorScheme _test2ColorScheme = ColorScheme(
  primary: test2_color1_100,
  primaryContainer: test2_color2_900,
  secondary: test2_color1_50,
  secondaryContainer: test2_color2_900,
  surface: test2_colorSurfaceWhite,
  background: test2_colorBackgroundWhite,
  error: test2_color_ErrorRed, // errorColor هنا بدلاً من
  onPrimary: test2_color2_900,
  onSecondary: test2_color2_900,
  onSurface: test2_color2_900,
  onBackground: test2_color2_900,
  onError: test2_colorSurfaceWhite,
  brightness: Brightness.dark,
);

const Color test2_color1_50 = Color(0xFF263E45);
const Color test2_color1_100 = Color(0xFF243438);
const Color test2_color1_300 = Color(0xFF111F26);
const Color test2_color1_400 = Color(0xFF1D4850);

const Color test2_color2_900 = Color(0xFF442B2D);
const Color test2_color2_600 = Color(0xFF7D4F52);

const Color test2_color_ErrorRed = Color(0xFFC5032B);

const Color test2_colorSurfaceWhite = Color(0xFF171413);
const Color test2_colorBackgroundWhite = Colors.black87;

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light(useMaterial3: true);
  return base.copyWith(
    colorScheme: _shrineColorScheme,
    primaryColor: shrinePink100,
    scaffoldBackgroundColor: shrineBackgroundWhite,
    cardColor: shrineBackgroundWhite,
    // errorColor is now in colorScheme
    buttonTheme: const ButtonThemeData(
      colorScheme: _shrineColorScheme,
    ),
    primaryIconTheme: _customIconTheme(base.iconTheme),
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base.copyWith(
    displayLarge: base.displayLarge?.copyWith(
      fontWeight: FontWeight.w500,
      letterSpacing: defaultLetterSpacing,
    ),
    titleLarge: base.titleLarge?.copyWith(
      fontSize: 18,
      letterSpacing: defaultLetterSpacing,
    ),
    bodySmall: base.bodySmall?.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: defaultLetterSpacing,
    ),
    bodyLarge: base.bodyLarge?.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      letterSpacing: defaultLetterSpacing,
    ),
    bodyMedium: base.bodyMedium?.copyWith(
      letterSpacing: defaultLetterSpacing,
    ),
    headlineMedium: base.headlineMedium?.copyWith(
      letterSpacing: defaultLetterSpacing,
    ),
    labelLarge: base.labelLarge?.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      letterSpacing: defaultLetterSpacing,
    ),
  ).apply(
    fontFamily: 'Rubik',
    displayColor: shrineBrown900,
    bodyColor: shrineBrown900,
  );
}

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: shrineBrown900);
}

const ColorScheme _shrineColorScheme = ColorScheme(
  primary: shrinePink100,
  primaryContainer: shrineBrown900,
  secondary: shrinePink50,
  secondaryContainer: shrineBrown900,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed, // errorColor هنا بدلاً من
  onPrimary: shrineBrown900,
  onSecondary: shrineBrown900,
  onSurface: shrineBrown900,
  onBackground: shrineBrown900,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);

const Color shrinePink50 = Color(0xFFFEEAE6);
const Color shrinePink100 = Color(0xFFFEDBD0);
const Color shrinePink300 = Color(0xFFFBB8AC);
const Color shrinePink400 = Color(0xFFEAA4A4);

const Color shrineBrown900 = Color(0xFF442B2D);
const Color shrineBrown600 = Color(0xFF7D4F52);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;

const defaultLetterSpacing = 0.03;

class DynamicThemesExampleAppp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeCollection = ThemeCollection(
        themes: {
          AppThemes.LightBlue: ThemeData(
            useMaterial3: true,
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: kColorsWhite,
            ),
            textTheme: TextTheme(
                headlineSmall: TextStyle(
                    fontSize: 16.0.sp,
                    color: kColorsLightBlack
                ),
                headlineMedium: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                displaySmall: TextStyle(
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.w500,
                    color: kColorsLightBlack),
                displayLarge: TextStyle(
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.bold,
                    color: kColorsBlack),
                displayMedium: TextStyle(
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
                titleLarge: TextStyle(
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                bodyMedium: TextStyle(fontSize: 14.0.sp, color: kColorsBlack),
                bodyLarge: TextStyle(fontSize: 12.0.sp, color: kColorsBlack, fontWeight: FontWeight.w300,),
                bodySmall: TextStyle(fontSize: 10.0.sp, color: Colors.grey, fontWeight: FontWeight.w300,)
            ),
            iconTheme: IconThemeData(
              color: kColorsBlack,
            ),
            scaffoldBackgroundColor: kColorsDeepWhite,
            appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: kColorsBlack),
                backgroundColor: kColorsDeepWhite // صحيح في AppBarTheme
            ),
            primaryColor: kColorsWhite,
            fontFamily: 'ArbFONTS-DINNextLTArabic',
            colorScheme: ColorScheme.light(primary: Colors.blue),
          ),
          AppThemes.LightRed: _buildShrineTheme(),
          AppThemes.DarkBlue: ThemeData.dark(useMaterial3: true).copyWith(
            colorScheme: ColorScheme.dark(primary: Colors.red),
          ),
          AppThemes.DarkRed: ThemeData.dark(useMaterial3: true).copyWith(
            colorScheme: ColorScheme.dark(primary: Colors.red, secondary: Colors.red),
          ),
          AppThemes.test1: _buildThemeTest1(),
          AppThemes.test2: _buildThemeTest2(),
        }
    );

    return DynamicTheme(
        themeCollection: themeCollection,
        defaultThemeId: AppThemes.LightBlue,
        builder: (context, theme) {
          return MaterialApp(
            title: 'إعدادات',
            theme: theme,
            home: HomePage(title: 'إعدادات'),
          );
        }
    );
  }
}

// HomePage يبقى كما هو بدون تغيير
class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int dropdownValue = 0;
  bool isSwitched1 = true, isSwitched2 = false;
  bool isSwitched3 = false, isSwitched4 = true;

  @override
  Widget build(BuildContext context) {
    dropdownValue = DynamicTheme.of(context)!.themeId;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // ... باقي الـ Widgets بدون تغيير
            Container(
              child: Text("الثيم", style: MyText.body1(context)!.copyWith(color: Colors.grey[500])),
              margin: EdgeInsets.fromLTRB(15, 18, 15, 0),
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
              elevation: 2,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(height: 10),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.theater_comedy, size: 25.0, color: Colors.grey[500]),
                            Container(width: 10),
                            DropdownButton(
                                value: dropdownValue,
                                items: [
                                  DropdownMenuItem(
                                    value: AppThemes.LightBlue,
                                    child: Text(AppThemes.toStr(AppThemes.LightBlue)),
                                  ),
                                  DropdownMenuItem(
                                    value: AppThemes.test1,
                                    child: Text(AppThemes.toStr(AppThemes.test1)),
                                  ),
                                  DropdownMenuItem(
                                    value: AppThemes.test2,
                                    child: Text(AppThemes.toStr(AppThemes.test2)),
                                  )
                                ],
                                onChanged: (dynamic themeId) async {
                                  await DynamicTheme.of(context)!.setTheme(themeId);
                                  Get.changeTheme(AppThemes.toStr2(themeId));
                                  setState(() {
                                    dropdownValue = themeId;
                                  });
                                }
                            ),
                            Spacer(),
                            Icon(Icons.arrow_downward, size: 25.0, color: Colors.grey[500]),
                          ],
                        ),
                      ),
                    ),
                    Container(height: 10),
                  ],
                ),
              ),
            ),
            // ... باقي الـ Widgets
          ],
        ),
      ),
    );
  }
}