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

  Travel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    rating = json['rating'];
    price = json['price'];
    country = json['country'];
    imageUrl = json['imageUrl'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['rating'] = this.rating;
    data['price'] = this.price;
    data['country'] = this.country;
    data['imageUrl'] = this.imageUrl;
    data['id'] = this.id;
    return data;
  }
}