import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:kyla_task/ui/home/views/brand_screen.dart';
import 'package:kyla_task/ui/home/view_models/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeViewModel viewModel = Get.put(HomeViewModel());

    return DefaultTabController(
      length: viewModel.brands.length,
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: TabBar(
              isScrollable: true,
              labelColor: Colors.black,
              indicatorColor: Colors.transparent,
              unselectedLabelColor: Colors.grey,
              tabs: [
                for (final brand in viewModel.brands) Tab(text: brand),
              ],
            )),
        body: Container(
          color: Colors.white,
          child: TabBarView(
            children: [
              for (final brand in viewModel.brands) BrandScreen(brandName: brand),
            ],
          ),
        ),
      ),
    );
  }
}
