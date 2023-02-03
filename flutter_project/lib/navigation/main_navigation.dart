import 'package:flutter/material.dart';
import '../page_factory/page_factory.dart';

abstract class MainNavigationRouteName {
  static const main = '/';
}

class MainNavigation {
  final initialRoute = MainNavigationRouteName.main;

  Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
        initialRoute: (_) => FactoryPage().mainPage(),
      };
  Route? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(child: Text('ошибка навигации ! , ${settings.name}')),
      ),
    );
  }
}
