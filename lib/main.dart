import 'package:flutter/material.dart';
import 'package:fourth/layout/home_layout.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fourth/screens/settings_tab/news_tab.dart';
import 'package:fourth/screens/settings_tab/settings_tab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      locale:Locale("en"),
      debugShowCheckedModeBanner: false,
        routes: {
          HomeLayout.routeName:(context) => HomeLayout(),
          SettingsTab.routeName:(context) => SettingsTab(),
        },
      initialRoute: HomeLayout.routeName,

    );
  }
}


