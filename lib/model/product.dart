import 'package:get/get.dart';

class Product {
  String name;
  String price;
  String color;
  int count;
  String image;

  Product(this.name, this.price, this.color, this.count, this.image);
}

List<Product> productList = [
  Product('item1', "100\$", 'red', 0,'asset/images/s1.jpg'),
  Product('item2', "200\$", 'blue', 0,'asset/images/s2.jpg'),
  Product('item3', "300\$", 'green', 0,'asset/images/s3.jpg'),
  Product('item4', "400\$", 'yellow', 0,'asset/images/s4.jpg'),
  Product('item5', "500\$", 'purple', 0,'asset/images/s5.jpg'),
  Product('item6', "600\$", 'black', 0,'asset/images/s6.jpg'),
  Product('item7', "700\$", 'brown', 0,'asset/images/s7.jpg'),
  Product('item8', "800\$", 'pink', 0,'asset/images/s8.jpg'),
  Product('item9', "900\$", 'cyan', 0,'asset/images/s9.jpg'),
];

