import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'menu_controller/menu_controller.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        spacing: 10.0,
        runSpacing: 10.0,
        direction: Axis.horizontal,
        children: List.generate(
          CategoryPage.values.length,
          (index) => _ItemBuild(index: index),
        ),
      ),
    );
  }
}

class _ItemBuild extends StatelessWidget {
  final int index;
  const _ItemBuild({required this.index});
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<MenuController>();
    final title = CategoryPage.values[index].name.toString();
    final bool select = title == controller.categoryPageName.name;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => controller.setScreen(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(select ? 15 : 10),
                color: select ? Colors.teal : Colors.teal[200]),
            child: Text(title),
          ),
        ),
      ],
    );
  }
}
