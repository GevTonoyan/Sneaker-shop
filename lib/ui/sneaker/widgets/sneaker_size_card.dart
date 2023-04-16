import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kyla_task/ui/sneaker/view_models/sneaker_view_model.dart';

class SneakerSizeCard extends StatelessWidget {
  final double size;

  const SneakerSizeCard({
    required this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SneakerViewModel viewModel = Get.find();

    return Obx(() {
      final isItemSelected = viewModel.selectedSize.value == size;

      return InkWell(
        onTap: () {
          viewModel.selectedSize.value = size;
        },
        child: Container(
          width: 80,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: isItemSelected ? Colors.black : Colors.white,
            border: Border.all(
              color: isItemSelected ? Colors.black : Colors.grey,
              width: 1.0,
            ),
          ),
          child: Center(
              child: Text(
            size.toStringAsFixed(1),
            style: TextStyle(color: isItemSelected ? Colors.white : Colors.black),
          )),
        ),
      );
    });
  }
}
