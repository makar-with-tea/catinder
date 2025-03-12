import 'package:catinder/screens/cat_screen.dart';
import 'package:catinder/screens/home_screen.dart';
import 'package:catinder/tools/app_theme.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catinder',
      theme: AppTheme.theme(false),
      home: HomeScreen(),
      routes: <String, WidgetBuilder>{
        CatScreen.routeName: (BuildContext context) => CatScreen(),
      },
    );
  }
}
