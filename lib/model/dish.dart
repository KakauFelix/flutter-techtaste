class Dish {
  final String id;
  final String imagePath;
  final String name;
  final String description;
  final int price;

  Dish({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.description,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imagePath': imagePath,
      'name': name,
      'description': description,
      'price': price,
    };
  }

  factory Dish.fromMap(Map<String, dynamic> map) {
    return Dish(
      id: map['id'],
      imagePath: map['imagePath'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
    );
  }

  @override
  String toString() {
    return 'Dish(id: $id, imagePath: $imagePath, name: $name, description: $description, price: $price)';
  }
}
