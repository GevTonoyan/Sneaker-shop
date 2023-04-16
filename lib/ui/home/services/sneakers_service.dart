import 'dart:math';

import 'package:kyla_task/extensions/brands_extension.dart';
import 'package:kyla_task/models/SneakerModel.dart';
import 'package:kyla_task/ui/home/view_models/home_view_model.dart';

class SneakersServiceImpl extends SneakersService {
  @override
  Map<String, List<SneakerModel>> getAllSneakers() {
    final random = Random();

    final productNames = <String>[
      'Air Max',
      'Superstar',
      'Jordan',
      'Clyde',
      'Classic',
      'Gel-Kayano',
      'Legacy',
      'Disruptor',
    ];

    final descriptions = <String>[
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ];

    final sneakers = <String, List<SneakerModel>>{};

    for (final brand in Brands.values) {
      final models = <SneakerModel>[];

      for (var i = 1; i <= 4; i++) {
        final String productName = '${productNames[random.nextInt(productNames.length)]} $i';
        final String description = descriptions[random.nextInt(descriptions.length)];
        final double price = random.nextDouble() * 300 + 50;
        final String imagePath = 'assets/sneakers/sneaker_0$i.png';
        final SneakerModel model = SneakerModel(
          id: i,
          brandName: brand.toName(),
          productName: productName,
          price: price,
          imagePath: imagePath,
          description: description,
        );
        models.add(model);
      }
      sneakers[brand.toName()] = models;
    }

    return sneakers;
  }
}

abstract class SneakersService {
  Map<String, List<SneakerModel>> getAllSneakers();
}
