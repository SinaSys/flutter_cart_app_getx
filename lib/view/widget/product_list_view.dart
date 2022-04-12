import 'package:cart_app_getx/view/screen/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/product_controller.dart';
import '../../model/product.dart';
import '../../until/constants.dart';

final ProductController controller = Get.put(ProductController());

class ProductListView extends StatelessWidget {
  const ProductListView();

  Widget countButton(int index, void Function(int index) counter,
      {IconData icon = Icons.add}) {
    return RawMaterialButton(
      onPressed: () {
        counter(index);
      },
      elevation: 2.0,
      fillColor: Colors.white,
      child: Icon(
        icon,
        size: 15,
      ),
      shape: const CircleBorder(),
    );
  }


  @override
  Widget build(BuildContext context) {
    Widget listViewBody(Product item, int index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ProductDetailScreen(item.name,item.image);
          },),);
        },
        child: Card(
          child: Row(
            children: [
              const SizedBox(width: 20),
              Image.asset(item.image, fit: BoxFit.contain, width: 60),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name, style: kItemNameStyle),
                  Text(item.color, style: kItemColorStyle),
                  Text(item.price, style: kItemPriceStyle),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  countButton(index, controller.increase),
                  Obx(() => Text(controller.allProducts[index].count.toString())),
                  countButton(index, controller.decrease, icon: Icons.remove)
                ],
              )
            ],
          ),
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: controller.allProducts.length,
      itemBuilder: (_, index) {
        Product item = controller.allProducts[index];
        if (controller.isItemListScreen) {
          return listViewBody(item, index);
        } else if (controller.isCartScreen && item.count > 0) {
          return listViewBody(item, index);
        } else {
          return Container();
        }
      },
    );
  }
}
