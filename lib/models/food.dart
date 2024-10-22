class Food {
  String name;
  String price;
  String ImagePath;
  String rating;
  String description;

  Food({
  required this.name,
  required this.price,
  required this.ImagePath,
  required this.rating,
  required this.description,
});

String get _name => name;
String get _price => price;
String get _ImagePath => ImagePath;
String get _rating => rating;
String get _description => description;
}

