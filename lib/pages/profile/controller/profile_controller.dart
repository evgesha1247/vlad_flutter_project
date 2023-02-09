import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends ChangeNotifier {
List<String>? data = <String>[];
  String? imgUrl;
  final imgController = TextEditingController();

  late final SharedPreferences story;
  ProfileController(){

    getData() ;
    getImg();
  }
  getImg() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('ProfileImg')) {
      imgUrl = prefs.getString('ProfileImg');
    }
    imgController.text = '';
    notifyListeners();
  }

  // https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80

// https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80

  upDataImg(context) async {
    if (imgController.text.isNotEmpty) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('ProfileImg', imgController.text);
      await getImg();
      Navigator.pop(context);
    } else {
      print('text is null ');
    }

  }
  getData() async {
    story = await SharedPreferences.getInstance();
    data = story.getStringList('profileData');
    notifyListeners();
  }
}
