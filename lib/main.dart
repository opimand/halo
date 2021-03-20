import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:halo/localization/localization.dart';
import 'package:halo/providers/video_provider.dart';
import 'package:halo/screens/profile_screen.dart';
import 'package:halo/screens/progress_screen.dart';
import 'package:halo/screens/video_list_screen.dart';
import 'package:halo/screens/video_player_screen.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: VideoProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Halo',
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/video_list': (context) => VideoListScreen(),
          '/video_play': (context) => VideoPlayerScreen(),
          '/profile_screen': (context) => ProfileScreen(),
          '/progress_screen': (context) => ProgressScreen(),
        },
        theme: ThemeData(
          primarySwatch: Colors.orange,
          textTheme: TextTheme(
            headline4: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        supportedLocales: [
          Locale('en', 'US'),
          Locale('ar', ''),
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      ),
    );
  }
}
