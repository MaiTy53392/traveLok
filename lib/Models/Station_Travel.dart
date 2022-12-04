class Travel {
  String? title;
  String? description;
  int? rating;
  int? price;
  String? country;
  String? imageUrl;
  String? id;

  Travel(
      {this.title,
      this.description,
      this.rating,
      this.price,
      this.country,
      this.imageUrl,
      this.id});

  Travel.fromMap(Map<String, dynamic> data, String idCollection) {
    title = data['title'];
    description = data['description'];
    rating = data['rating'];
    price = data['price'];
    country = data['country'];
    imageUrl = data['imageUrl'];
    id = idCollection;
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'rating': rating,
      'price': price,
      'country': country,
      "imageUrl": imageUrl
    };
  }
}
