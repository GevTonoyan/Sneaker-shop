import 'package:get/get.dart';
import 'package:kyla_task/extensions/brands_extension.dart';
import 'package:kyla_task/models/SneakerModel.dart';
import 'package:kyla_task/ui/home/services/sneakers_service.dart';

enum Brands { nike, adidas, jordan, puma, rebook, asics, gymshark, fila }

class HomeViewModel extends GetxController {
  late final SneakersService _sneakersService;

  HomeViewModel() {
    _sneakersService = SneakersServiceImpl();
    _allSneakers = _sneakersService.getAllSneakers();
  }

  late final Map<String, List<SneakerModel>> _allSneakers;

  Map<String, List<SneakerModel>> get allSneakers => _allSneakers;

  final _brands = Brands.values.map((brand) => brand.toName()).toList();

  List<String> get brands => _brands;
}
