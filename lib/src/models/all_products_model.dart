class ProductsModel {
  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  late final int id;
  late final String title;
  late final double price;
  late final String description;
  late final String category;
  late final String image;
  late final Rating rating;

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'].toDouble();
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = Rating.fromJson(json['rating']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;
    data['rating'] = rating.toJson();
    return data;
  }
}

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  late final double rate;
  late final int count;

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'].toDouble();
    count = json['count'].toInt();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['rate'] = rate;
    data['count'] = count;
    return data;
  }
}
