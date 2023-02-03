import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/pages/menu/menu.dart';
import 'package:flutter_application_1/pages/stac_page/stac_pages.dart';
import 'package:flutter_application_1/pages/stac_page/stac_page_controller.dart/pages_controller.dart';
import 'package:provider/provider.dart';

import '../pages/home/home.dart';
import '../pages/home/home_controller/home_controller.dart';
import '../pages/menu/menu_controller/menu_controller.dart';

class FactoryPage {
  Widget mainPage() => MultiProvider(
        providers: [
          ChangeNotifierProvider<PagesController>(
            create: (_) => PagesController(),
          ),
        ],
        child: const StacPages(),
      );


  Widget makeMenu() => ChangeNotifierProvider(
        create: (_) => MenuController(),
        child: const MenuPage(),
      );

  Widget makeHome() => ChangeNotifierProvider(
        create: (_) => HomeController(),
        child: const HomePage(),
      );

}
