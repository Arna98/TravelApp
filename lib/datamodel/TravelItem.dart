class TravelItem {
  String? _image, _title, _location, _description;
  double? _distance, _temp, _rating, _price;

  set setImage(String? image) => _image = image;

  String? get getImage => _image;

  set setTitle(String? title) => _title = title;

  String? get getTitle => _title;

  set setLocation(String? location) => _location = location;

  String? get getLocation => _location;

  set setDescription(String? description) => _description = description;

  String? get getDescription => _description;

  set setDistance(double? distance) => _distance = distance;

  double? get getDistance => _distance;

  set setTemp(double? temp) => _temp = temp;

  double? get getTemp => _temp;

  set setRating(double rating) => _rating = rating;

  double? get getRating => _rating;

  set setPrice(double? price) => _price = price;

  double? get getPrice => _price;
}
