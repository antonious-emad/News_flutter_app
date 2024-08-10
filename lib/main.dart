import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fourth/layout/home_layout.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fourth/news_details.dart';
import 'package:fourth/prefs_helper.dart';
import 'package:fourth/provider/my_provider.dart';
import 'package:fourth/screens/settings_tab/settings_tab.dart';
import 'package:fourth/search_screen.dart';
import 'package:fourth/web_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  PrefsHelper.prefs = await SharedPreferences.getInstance();
  Bloc.observer = MyBlocObserver();
  runApp(ChangeNotifierProvider(create: (context) => MyProvider()..init(),child: MyApp()));
}

class MyApp extends StatelessWidget {
 MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
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
      locale:Locale(pro.Language),
      themeMode: pro.mode,
      debugShowCheckedModeBanner: false,
        routes: {
          HomeLayout.routeName:(context) => HomeLayout(),
          SettingsTab.routeName:(context) => SettingsTab(),
          NewsDetails.routeName:(context)=>NewsDetails(),
          WebViewScreen.routeName:(context)=>WebViewScreen(),
          SearchScreen.routeName:(context)=>SearchScreen(),
        },
      initialRoute: HomeLayout.routeName,

    );
  }
}


