import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_colors.dart';

/// light theme
ThemeData customTheme(
  BuildContext context,
) {
  return ThemeData(
      scaffoldBackgroundColor: primaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: accentColor,
      ),
      errorColor: fromHex('#B00020'),
      colorScheme: Theme.of(context).colorScheme.copyWith(
            background: primaryColor,
            secondary: primaryColor,
            primary: primaryColor,
            brightness: Brightness.dark,
          ),
      platform: defaultTargetPlatform,
      highlightColor: accentColor.withOpacity(.5),
      primaryColor: primaryColor,
      indicatorColor: accentColor,
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: accentColor),
      unselectedWidgetColor: Colors.grey,
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Color.fromRGBO(250, 250, 250, 1),
      accentColor: accentColor,
      inputDecorationTheme: InputDecorationTheme(
        fillColor: fromHex('#eceff1'),
        filled: true,
        alignLabelWithHint: true,
        hintStyle: Theme.of(context).textTheme.bodyText1,
        contentPadding: EdgeInsets.all(15.0),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: fromHex('#eceff1'), width: .5),
            borderRadius: BorderRadius.all(Radius.circular(8.5))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300]!, width: .5),
            borderRadius: BorderRadius.all(Radius.circular(8.5))),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: fromHex('#E5E5E5')),
            borderRadius: BorderRadius.all(Radius.circular(8.5))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: fromHex('#B00020').withOpacity(.5)),
            borderRadius: BorderRadius.all(Radius.circular(8.5))),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: fromHex('#B00020')),
            borderRadius: BorderRadius.all(Radius.circular(8.5))),
        labelStyle: Theme.of(context).textTheme.bodyText1,
        errorStyle: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: fromHex('#B00020')),
      ),
      iconTheme: IconThemeData(color: Colors.black),
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: Colors.black.withOpacity(.5),
      ),
      textTheme: Typography.material2018(platform: defaultTargetPlatform)
          .white
          .copyWith(
            bodyText1: TextStyle(
              color: Colors.black,
            ),
            bodyText2: TextStyle(
              color: Colors.black,
            ),
            caption: TextStyle(
              color: Colors.black,
            ),
            headline1: TextStyle(color: Colors.black),
            headline2: TextStyle(color: Colors.black),
            headline3: TextStyle(color: Colors.black),
            headline4: TextStyle(color: Colors.black),
            headline5: TextStyle(color: Colors.black),
            headline6: TextStyle(color: Colors.black),
            subtitle1: TextStyle(color: Colors.black),
            subtitle2: TextStyle(color: Colors.black),
            overline: TextStyle(color: Colors.black),
            button: TextStyle(color: Colors.black),
          ),
      dividerColor: accentColor,
      appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          elevation: 0,
          color: primaryColor,
          iconTheme: IconThemeData(color: fromHex('#000000')),
          textTheme: Typography.material2018(platform: defaultTargetPlatform)
              .white
              .copyWith(
                bodyText1: TextStyle(color: Colors.black, fontSize: 17),
                bodyText2: TextStyle(color: Colors.black, fontSize: 14),
                caption: TextStyle(color: Colors.black, fontSize: 12),
                headline1: TextStyle(color: Colors.black, fontSize: 96),
                headline2: TextStyle(color: Colors.black, fontSize: 60),
                headline3: TextStyle(color: Colors.black, fontSize: 48),
                headline4: TextStyle(color: Colors.black, fontSize: 34),
                headline5: TextStyle(color: Colors.black, fontSize: 24),
                headline6: TextStyle(color: Colors.black, fontSize: 20),
                subtitle1: TextStyle(color: Colors.black, fontSize: 16),
                subtitle2: TextStyle(color: Colors.black, fontSize: 14),
                overline: TextStyle(color: Colors.black, fontSize: 10),
                button: TextStyle(color: Colors.black, fontSize: 16),
              )));
}
