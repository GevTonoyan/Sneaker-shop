class SneakerSizesServiceImpl extends SneakerSizesService {
  @override
  List<double> getSizes() {
    return <double>[7, 7.5, 8, 8.5, 9, 9.5, 10, 10.5, 11, 11.5, 12, 12.5, 13, 13.5, 14];
  }
}

abstract class SneakerSizesService {
  List<double> getSizes();
}
