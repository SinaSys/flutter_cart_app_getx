import 'package:cart_app_getx/model/product.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList<Product> filteredProduct = allProductList.obs;
  Rx<int> itemCount = 0.obs;
  Rx<double> price = 0.0.obs;
  final List<String> productCategory =
      EnumToString.toList(ProductCategory.values);

  navigateToCartScreen() {
    calculatePrice();
    List<Product> filteredList = [];
    for (Product item in filteredProduct) {
      if (item.quantity > 0) {
        filteredList.add(item);
      }
    }
    filteredProduct.assignAll(filteredList);
  }

  countAllItems() {
    itemCount.value = 0;
    for (var element in filteredProduct) {
      itemCount.value += element.quantity;
    }
  }

  void filteredListByCategory(ProductCategory category) {
    if (category == ProductCategory.all) {
      filteredProduct.assignAll(allProductList);
    } else {
      filteredProduct.assignAll(
        allProductList.where((item) => item.category == category),
      );
    }
  }

  calculatePrice() {
    price.value = 0.0;
    for (var element in filteredProduct) {
      if (element.quantity > 0) {
        price.value = (double.parse(element.price.replaceAll("\$", "").trim()) *
                element.quantity) +
            price.value;
      }
    }
  }

  void navigateToListItemScreen() {
    List<Product> filteredList = <Product>[];
    for (Product item in allProductList) {
      Product product = filteredProduct.firstWhere(
          (element) => element.name == item.name,
          orElse: () => item);
      filteredList.add(product);
    }
    filteredProduct.assignAll(filteredList);
  }

  void increase(int index) {
    filteredProduct[index].quantity++;
    filteredProduct.refresh();
    countAllItems();
    calculatePrice();
  }

  void decrease(int index) {
    if (filteredProduct[index].quantity > 0) {
      filteredProduct[index].quantity--;
      filteredProduct.refresh();
      countAllItems();
      calculatePrice();
    }
  }

  void removeItems() {
    for (Product item in filteredProduct) {
      item.quantity = 0;
    }
    filteredProduct.refresh();
    itemCount.value = 0;
    calculatePrice();
  }

  VoidCallback? isCheckOutButtonEnabled() {
    if (itemCount > 0) return () {};
    return null;
  }
}
