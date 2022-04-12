import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/product_controller.dart';
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
          badgeContent: Obx(()=> Text(controller.itemCount.value.toString())),
        ),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: controller.navigateToCartScreen,
            ),
          );
        }
      ),
      appBar: AppBar(
        title: const Text("Item list"),
      ),
      body: const ProductListView(),
    );
  }
}
