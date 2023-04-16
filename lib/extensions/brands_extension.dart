import '../ui/home/view_models/home_view_model.dart';

extension BrandsExtension on Brands {
  static const _valuesToNames = {
    Brands.nike: 'Nike',
    Brands.adidas: 'Adidas',
    Brands.jordan: 'Jordan',
    Brands.puma: 'Puma',
    Brands.rebook: 'Rebook',
    Brands.asics: 'Asics',
    Brands.gymshark: 'Gymshark',
    Brands.fila: 'Fila',
  };

  static const _namesToValues = {
    'Nike': Brands.nike,
    'Adidas': Brands.adidas,
    'Jordan': Brands.jordan,
    'Puma': Brands.puma,
    'Rebook': Brands.rebook,
    'Asics': Brands.asics,
    'Gymshark': Brands.gymshark,
    'Fila': Brands.fila,
  };

  String toName() => _valuesToNames[this] ?? '';

  static Brands? fromName(String name) => _namesToValues[name];
}
