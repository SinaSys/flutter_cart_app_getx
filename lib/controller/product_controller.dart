import 'package:cart_app_getx/model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../view/screen/cart_screen.dart';

class ProductController extends GetxController {
  RxList<Product> allProducts = productList.obs;
  bool isItemListScreen = true;
  bool isCartScreen = false;
  Rx<int> itemCount = 0.obs;
  Rx<double> price = 0.0.obs;

  Widget navigateToCartScreen(BuildContext context) {
    isCartScreen = true;
    isItemListScreen = false;
    calculatePrice();
    return const CartScreen();
  }

  countAllItems() {
    itemCount.value = 0;
    for (var element in allProducts) {
      itemCount.value += element.count;
    }
  }

  calculatePrice() {
    price.value = 0.0;
    for (var element in allProducts) {
      if (element.count > 0) {
        price.value = (double.parse(element.price.replaceAll("\$", "").trim()) * element.count) +
            price.value;
      }
    }
  }

  Future<bool> navigateToListItemScreen() async {
    controller.isCartScreen = false;
    controller.isItemListScreen = true;
    return true;
  }

  void increase(int index) {
    allProducts[index].count++;
    allProducts.refresh();
    countAllItems();
    calculatePrice();
  }

  void decrease(int index) {
    if (allProducts[index].count > 0) {
      allProducts[index].count--;
      allProducts.refresh();
      countAllItems();
      calculatePrice();
    }
  }

  void removeItems(){
    for(var item in allProducts)
      item.count = 0;
    allProducts.refresh();
    itemCount.value = 0;
    calculatePrice();
  }


  VoidCallback? isCheckOutButtonEnabled(){
    if(itemCount>0) return (){};
    return null;
  }
}
