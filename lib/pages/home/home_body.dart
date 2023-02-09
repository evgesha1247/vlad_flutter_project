import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/my_text_field/my_text_field.dart';
import 'home_controller/home_controller.dart';
const List<Widget> _listWidgets = [_Delivery(), _Pickup()];
const List<String> _listTitle = ['_Delivery'];
final widgets = List.generate(
  _listWidgets.length,
  (index) => Column(
    children: [
      if (_listTitle.length > index)
        Column(
          children: [
            _TitleHome(title: _listTitle[index]),
            const SizedBox(height: 9),
          ],
        ),
      _listWidgets[index]
    ],
  ),
);



class HomeBody extends StatelessWidget {
  const HomeBody({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    return IndexedStack(
      index: controller.currentIndexPage,
      children: widgets,
    );
  }
}


class _Delivery extends StatelessWidget {
  const _Delivery();
  @override
  Widget build(BuildContext context) {
    return const MyTextField(hintText: 'adress');
  }
}

class _Pickup extends StatelessWidget {
  const _Pickup();
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _TitleHome extends StatelessWidget {
  final String title;
  const _TitleHome({required this.title});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Text(title)],
    );
  }
}
