import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/item_model.dart';
import 'package:provider/provider.dart';
import '../../models/cart_model.dart';
import '../cart/cart_controlle/cart_controller.dart';
import 'menu_controller/menu_controller.dart';

class MenuBody extends StatelessWidget {
  const MenuBody({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<MenuControll>();
    return Expanded(
      child: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.productData?.length ?? 0,
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
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.teal[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ItemImg(img: item.img!),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _ItemTitle(name: item.name ?? ''),
                        const SizedBox(height: 9),
                        _ItemDescription(description: item.description ?? ''),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            UpDataItem(item: item),
          ],
        ),
      ),
    );
  }
}

class _ItemImg extends StatelessWidget {
  final String img;
  const _ItemImg({required this.img});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image(
        fit: BoxFit.cover,
        image: NetworkImage(img),
      ),
    );
  }
}

class _ItemTitle extends StatelessWidget {
  final String name;
  const _ItemTitle({required this.name});
  @override
  Widget build(BuildContext context) {
    return Text(name);
  }
}

class _ItemDescription extends StatelessWidget {
  final String description;
  const _ItemDescription({required this.description});
  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class UpDataItem extends StatelessWidget {
  final ProductData item;

  const UpDataItem({required this.item});
  @override
  Widget build(BuildContext context) {
    final cardController = context.read<CartController>();
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            cardController.upDataCountProductInCart(false, item);
          },
          child: Icon(
            Icons.remove,
          ),
        ),
        GestureDetector(
          onTap: () => cardController.upDataCountProductInCart(true, item),
          child: Icon(
            Icons.add,
          ),
        ),
      ],
    );
  }
}
