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
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.teal[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ItemImg(img: item.img!),
          _ItemDescription(description: item.description!),
        ],
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

class _ItemDescription extends StatelessWidget {
  final String description;
  const _ItemDescription({required this.description});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
              child: Text(
                description,
                maxLines: 8,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
          _ItemPay(),
        ],
      ),
    );
  }
}

class _ItemPay extends StatelessWidget {
  const _ItemPay({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {}, child: Text('pay'));
  }
}
