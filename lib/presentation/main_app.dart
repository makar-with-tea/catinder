import 'package:catinder/presentation/app_theme.dart';
import 'package:catinder/presentation/screens/cat_screen.dart';
import 'package:catinder/presentation/screens/home_screen.dart';
import 'package:catinder/presentation/screens/liked_cats_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../generated/l10n.dart';
import 'di/di.dart';
import 'global.dart';
import 'navigation/navigation_service.dart';
import 'network_observer.dart';

// for network status
class MainAppWrapper extends StatefulWidget {
  const MainAppWrapper({super.key});

  @override
  State<MainAppWrapper> createState() => _MainAppWrapperState();
}

class _MainAppWrapperState extends State<MainAppWrapper> {
  @override
  void initState() {
    super.initState();
    NetworkObserver().startObserving();
  }

  @override
  void dispose() {
    NetworkObserver().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const MainApp();
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: getIt<NavigationService>().navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case CatScreen.routeName:
            return MaterialPageRoute(builder: (context) => const CatScreen());
          case LikedCatsScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => const LikedCatsScreen(),
            );
          default:
            return MaterialPageRoute(builder: (context) => const HomeScreen());
        }
      },
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'Catinder',
      theme: AppTheme.theme(false),
      home: HomeScreen(),
      routes: <String, WidgetBuilder>{
        CatScreen.routeName: (BuildContext context) => CatScreen(),
        LikedCatsScreen.routeName:
            (BuildContext context) => const LikedCatsScreen(),
      },
    );
  }
}
