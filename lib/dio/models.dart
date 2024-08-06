class ProductsOfCategoryModel {
  List<Product> products;

  ProductsOfCategoryModel({required this.products});

  factory ProductsOfCategoryModel.fromJson(Map<String, dynamic> json) {
    return ProductsOfCategoryModel(
      products: List<Product>.from(json['products'].map((x) => Product.fromJson(x))),
    );
  }
}

class Product {
  int id;
  String title;
  String category;
  String thumbnail;
  double price;

  Product({
    required this.id,
    required this.title,
    required this.category,
    required this.thumbnail,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      thumbnail: json['thumbnail'],
      price: json['price'].toDouble(),
    );
  }
}
