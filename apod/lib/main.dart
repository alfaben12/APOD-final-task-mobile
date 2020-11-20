import 'package:apod/screens/all_pictures_screen.dart';
import 'package:apod/screens/details_screen.dart';
import 'package:apod/screens/loading_screen.dart';
import 'package:apod/screens/past_pictures_screen.dart';
import 'package:apod/screens/saved_screen.dart';
import 'package:apod/screens/settings_screen.dart';
import 'package:apod/screens/submit_screen.dart';
import 'package:apod/services/media.dart';
import 'package:apod/services/saved_provider.dart';
import 'package:apod/services/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'strings.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: Strings.appTitle,
      color: Colors.white,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<Media>(create: (_) => Media()),
          ChangeNotifierProvider<SavedProvider>(create: (_) => SavedProvider()),
          ChangeNotifierProvider<SettingsProvider>(
              create: (_) => SettingsProvider()),
        ],
        child: MaterialApp(
          title: Strings.appTitle,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            primaryColor: Colors.white,
            primaryColorBrightness: Brightness.light,
            accentColor: Colors.white,
            accentColorBrightness: Brightness.light,
            primaryTextTheme: const TextTheme(
              bodyText1: TextStyle(
                color: Colors.white,
              ),
            ),
            iconTheme: const IconThemeData(color: Colors.white),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: LoadingScreen.routeName,
          routes: {
            AllPicturesScreeen.routeName: (_) => AllPicturesScreeen(),
            PastPicturesScreen.routeName: (_) => PastPicturesScreen(),
            SubmitScreen.routeName: (_) => SubmitScreen(),
            DetailsScreen.routeName: (_) => DetailsScreen(),
            SavedScreen.routeName: (_) => SavedScreen(),
            SettingsScreen.routeName: (_) => SettingsScreen(),
            LoadingScreen.routeName: (_) => LoadingScreen(),
          },
        ),
      ),
    );
  }
}
