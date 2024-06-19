class Product {
  late String _name;
  late String _description;
  late double _price;

  String get name => _name;
  set name(String value) {
    if (value.isNotEmpty) {
      _name = value;
    } else {
      throw ArgumentError('Name cannot be empty');
    }
  }

  String get description => _description;
  set description(String value) {
    if (value.isNotEmpty) {
      _description = value;
    } else {
      throw ArgumentError('Description cannot be empty');
    }
  }

  double get price => _price;
  set price(double value) {
    if (value > 0) {
      _price = value;
    } else {
      throw ArgumentError('Price must be greater than zero');
    }
  }
}