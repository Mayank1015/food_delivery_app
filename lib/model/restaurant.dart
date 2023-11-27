class MenuItem {
  final String name;
  final String description;
  final String price;
  final String imageUrl;

  MenuItem({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  MenuItem.fromMap(Map<dynamic, dynamic> res)
      : name = res['name'],
        description = res['description'],
        price = res['price'],
        imageUrl = res['imageUrl'];

  Map<String, Object?> toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}

class Review {
  final String username;
  final String comment;
  final double rating;

  Review({
    required this.username,
    required this.comment,
    required this.rating,
  });
}

class DetailedRestaurant {
  final String id;
  final String name;
  final String cuisineType;
  final double ratings;
  final String imageUrl;
  final String address;
  final List<MenuItem> menu;
  final List<Review> reviews;

  DetailedRestaurant({
    required this.id,
    required this.name,
    required this.cuisineType,
    required this.ratings,
    required this.imageUrl,
    required this.address,
    required this.menu,
    required this.reviews,
  });
}
