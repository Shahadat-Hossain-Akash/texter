// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:texter/screens/screen.dart';
import 'package:texter/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  static ThemeData darkBase = ThemeData.dark();
  static ThemeData lightBase = ThemeData.light();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Texter, Text it',
      theme: ThemeData(
        brightness: Brightness.dark,
        //colorScheme: darkBase.colorScheme.copyWith(secondary: accentColor),
        visualDensity: visualDensity,

        textTheme:
            GoogleFonts.nunitoTextTheme().apply(bodyColor: AppColors.textLigth),

        backgroundColor: DarkColors.background,
        appBarTheme: darkBase.appBarTheme.copyWith(
          backgroundColor: DarkColors.background,
          elevation: 0,
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        scaffoldBackgroundColor: DarkColors.background,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(primary: AppColors.secondary),
        ),
        cardColor: DarkColors.card,
        iconTheme: const IconThemeData(color: AppColors.iconLight),
      ),
      home: HomeScreen(),
    );
  }
}
