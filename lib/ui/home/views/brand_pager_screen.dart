import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kyla_task/ui/home/view_models/home_view_model.dart';
import 'package:kyla_task/ui/home/widgets/animated_sneaker_card.dart';
import 'package:kyla_task/ui/sneaker/views/sneaker_screen.dart';
import '../../../models/SneakerModel.dart';

class BrandPagerScreen extends StatefulWidget {
  final String brandName;

  const BrandPagerScreen({
    required this.brandName,
    Key? key,
  }) : super(key: key);

  @override
  State<BrandPagerScreen> createState() => _BrandPagerScreenState();
}

class _BrandPagerScreenState extends State<BrandPagerScreen> with TickerProviderStateMixin {
  late final List<SneakerModel> _sneakers;
  late final HomeViewModel _viewModel;

  final _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _viewModel = Get.find();
    _sneakers = _viewModel.allSneakers[widget.brandName]!;
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: _pageController,
        itemBuilder: (BuildContext context, int index) {
          final currentSneaker = _sneakers[index];

          double diff = index - _currentPage.toDouble();
          double scaleValue = 1 + diff.abs() * 0.1;
          double gauss = exp(-(pow((diff.abs() - 0.5), 2) / 0.08));
          double distance = 10;

          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 3, scaleValue)
              ..setEntry(0, 3, distance * gauss * diff.sign),
            child: Center(
              child: InkWell(
                onTap: () {
                  _routeToSneakerScreen(sneaker: currentSneaker);
                },
                child: RotatedBox(
                    quarterTurns: 1,
                    child: AnimatedSneakerCard(
                      sneaker: _sneakers[index],
                      onPressed: () {
                        _routeToSneakerScreen(sneaker: currentSneaker);
                      },
                    )),
              ),
            ),
          );
        },
        itemCount: _sneakers.length,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _routeToSneakerScreen({required SneakerModel sneaker}) {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 600),
            pageBuilder: (context, _, __) {
              return SneakerScreen(
                sneaker: sneaker,
                themeColor: AnimatedSneakerCard.colorsMap[sneaker.id] ?? Colors.orangeAccent,
              );
            }));
  }
}
