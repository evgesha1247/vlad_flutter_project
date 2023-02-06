import 'package:flutter/material.dart';

import '../../../navigation/main_navigation.dart';

class AuthController extends ChangeNotifier {
  List<TextEditingController> textEdi(List<String> data) => data.map((s) {
        return TextEditingController(text: s);
      }).toList();

  List<TextEditingController> textFieldControlls = <TextEditingController>[];
  showMainPage(BuildContext context) {
    //  Navigator.of(context).pushNamed(MainNavigation().initialRoute);
  }
}
