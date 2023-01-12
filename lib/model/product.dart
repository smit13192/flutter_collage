class Product {
  String? id;
  String company;
  String? composition;
  String description;
  String? fit;
  List<dynamic> image;
  int price;
  String title;

  Product(
      {required this.company,
      required this.title,
      required this.description,
      required this.composition,
      required this.price,
      required this.fit,
      required this.image,
      this.id});

  factory Product.fromMap(String id, Map<String, dynamic> product) {
    return Product(
      company: product['company'],
      title: product['title'],
      description: product['description'],
      composition: product['composition'],
      price: product['price'],
      fit: product['fit'],
      image: product['image'],
      id: id,
    );
  }

  Map<String, dynamic> toMap() => {
        'company': company,
        'title': title,
        'description': description,
        'composition': composition,
        'price': price,
        'fit': fit,
        'image': image
      };
}
