class Product {
  int? id;
  String? title;
  String? description;
  dynamic category;
  String? image;
  int? quantity;
  String? price;

  Product({
    this.id,
    this.title,
    this.description,
    this.category,
    this.image,
    this.quantity,
    this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      quantity: json['quantity'],
      price: json['price'],
    );
  }
}
