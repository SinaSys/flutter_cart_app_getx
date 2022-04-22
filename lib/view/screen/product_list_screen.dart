import 'package:badges/badges.dart';
import 'package:cart_app_getx/view/screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/product_controller.dart';
import '../../model/product.dart';
import '../widget/product_list_view.dart';

final ProductController controller = Get.put(ProductController());

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Badge(
              child: const Icon(Icons.shopping_cart),
              badgeContent: Obx(() => Text('${controller.itemCount.value}'))),
          onPressed: () {
            controller.navigateToCartScreen();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartScreen()));
          }),
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          PopupMenuButton<ProductCategory>(
            icon: const Icon(Icons.filter_alt),
            itemBuilder: (_) {
              return controller.productCategory
                  .asMap()
                  .map(
                    (int index, String item) {
                      return MapEntry<int, PopupMenuItem<ProductCategory>>(
                        index,
                        PopupMenuItem(
                          child: Text(item),
                          value: ProductCategory.values[index],
                        ),
                      );
                    },
                  )
                  .values
                  .toList();
            },
            onSelected: controller.filteredListByCategory,
          )
        ],
      ),
      body: const ProductListView(),
    );
  }
}
