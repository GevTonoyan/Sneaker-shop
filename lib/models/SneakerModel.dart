class SneakerModel {
  final int _id;
  final String _brandName;
  final String _productName;
  final String _description;
  final double _price;
  final String _imagePath;
  bool isFavorite;

  SneakerModel({
    required int id,
    required String brandName,
    required String productName,
    required double price,
    required String imagePath,
    String? description,
    this.isFavorite = false,
  })  : _id = id,
        _brandName = brandName,
        _productName = productName,
        _description = description ?? 'No description',
        _price = price,
        _imagePath = imagePath;

  int get id => _id;

  String get brandName => _brandName;

  String get productName => _productName;

  String get description => _description;

  double get price => _price;

  String get imagePath => _imagePath;
}
