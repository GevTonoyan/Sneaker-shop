import 'package:get/get.dart';
import 'package:kyla_task/ui/sneaker/services/sneaker_sizes_service.dart';

enum SupportedCountries { us, uk }

class SneakerViewModel extends GetxController {
  late final SneakerSizesService _sizesService;

  SneakerViewModel() {
    _sizesService = SneakerSizesServiceImpl();
    _availableSizes = _sizesService.getSizes();
    selectedSize = _availableSizes.first.obs;
  }

  late final List<double> _availableSizes;

  List<double> get availableSizes => _availableSizes;

  late RxDouble selectedSize;
}
