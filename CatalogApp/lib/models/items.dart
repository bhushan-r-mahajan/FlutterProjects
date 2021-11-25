class CatalogItem {
  static List<Items> product = [];
}

class Items {
  final int id;
  final String name;
  final String description;
  final num price;
  final String image;

  Items(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.image});

  factory Items.fromJson(Map<String, dynamic> map) {
    return Items(
      id: map["id"],
      name: map["name"],
      description: map["description"],
      price: map["price"],
      image: map["image"],
    );
  }

  toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "image": image,
      };
}
