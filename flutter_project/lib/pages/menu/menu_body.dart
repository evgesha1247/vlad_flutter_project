import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/item_model.dart';
import 'menu_controller/menu_controller.dart';

class MenuBody extends StatelessWidget {
  const MenuBody({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<MenuController>();
    return Expanded(
      child: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.productData?.length,
          itemBuilder: (_, int index) => _ItemBuilder(
            item: controller.productData![index],
          ),
        ),
      ),
    );
  }
}
class _ItemBuilder extends StatelessWidget {
  final ProductData item;
  const _ItemBuilder({required this.item});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(8),
      color: Colors.teal,
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Icon(Icons.add),
          ),
          Container(
            color: Colors.teal[200],
            child: Image(
              fit: BoxFit.cover,
              width: 100,
              image: NetworkImage(
                item.img!,
              ),
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              children: [
                Text(' ${item.name}'),
                Text(' ${item.price}\$'),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
