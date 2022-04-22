import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/product_controller.dart';
import '../../util/constants.dart';
import '../widget/product_list_view.dart';

final ProductController controller = Get.put(ProductController());

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        leading:
          IconButton(onPressed: (){
            controller.navigateToListItemScreen();
            Get.back();
          }, icon: const Icon(Icons.arrow_back_outlined)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed:controller.removeItems,
              icon: const Icon(Icons.delete_forever),
            ),
          )
        ],
      ),
      body: Column(
        children: [
         const Expanded(child: ProductListView()),
          SizedBox(
            height: 70,
            child: Column(
              children: [
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Obx(
                    () {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total",
                                style: kItemColorStyle.copyWith(fontSize: 12),
                              ),
                              Text(controller.price.value.toString(),
                                  style: kItemPriceStyle)
                            ],
                          ),
                          ElevatedButton(
                              onPressed: controller.isCheckOutButtonEnabled(),
                              child: const Text("Check out"))
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
