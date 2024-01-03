class Category {
  int? id;
  String? image;
  String? name;
  Category({
    this.id,
    this.image,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      image: json['image'],
      name: json['name'],
    );
  }
}
