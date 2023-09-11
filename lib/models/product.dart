// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  int id;
  String name;
  double price;
  String? img;
  Product({
    required this.id,
    required this.name,
    required this.price,
    this.img,
  });
}
