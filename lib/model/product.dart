
enum ProductCategory{
  all,
  mobile,
  tablet,
}

class Product {
  String name;
  String price;
  ProductCategory category;
  int quantity;
  String image;

  Product(this.name, this.price, this.category, this.quantity, this.image);

}

List<Product> allProductList = [
  Product('item1', "100\$", ProductCategory.mobile, 0,'asset/images/s1.jpg'),
  Product('item2', "200\$", ProductCategory.mobile, 0,'asset/images/s2.jpg'),
  Product('item3', "300\$", ProductCategory.mobile, 0,'asset/images/s3.jpg'),
  Product('item4', "400\$", ProductCategory.tablet, 0,'asset/images/s4.jpg'),
  Product('item5', "500\$", ProductCategory.mobile, 0,'asset/images/s5.jpg'),
  Product('item6', "600\$", ProductCategory.mobile, 0,'asset/images/s6.jpg'),
  Product('item7', "700\$", ProductCategory.tablet, 0,'asset/images/s7.jpg'),
  Product('item8', "800\$", ProductCategory.mobile, 0,'asset/images/s8.jpg'),
  Product('item9', "900\$", ProductCategory.mobile, 0,'asset/images/s9.jpg'),
];


