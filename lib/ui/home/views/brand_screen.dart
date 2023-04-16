import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kyla_task/models/SneakerModel.dart';
import 'package:kyla_task/ui/home/view_models/home_view_model.dart';
import 'package:kyla_task/ui/home/views/brand_pager_screen.dart';
import 'package:kyla_task/ui/home/widgets/standard_sneaker_card.dart';

const _sneakerCardSeparatorMargin = 16.0;

class BrandScreen extends StatelessWidget {
  final String brandName;

  const BrandScreen({
    required this.brandName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: RotatedBox(
            quarterTurns: 3,
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    title: const Center(
                      child: TabBar(
                        isScrollable: true,
                        labelColor: Colors.black,
                        indicatorColor: Colors.transparent,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Text('New'),
                          Text('Featured'),
                          Text('Upcoming'),
                        ],
                      ),
                    )),
                body: Container(
                  color: Colors.white,
                  child: TabBarView(
                    children: [
                      BrandPagerScreen(brandName: brandName),
                      BrandPagerScreen(brandName: brandName),
                      BrandPagerScreen(brandName: brandName),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'More',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
              Icon(Icons.arrow_forward)
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: _sneakerCardSeparatorMargin),
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return StandardSneakerCard(
                  sneaker: SneakerModel(
                id: index,
                brandName: brandName,
                productName: 'Air Max',
                price: 200.00,
                imagePath: 'assets/sneakers/sneaker_0${index % 4 + 1}.png',
              ));
            },
            separatorBuilder: (context, index) => const SizedBox(width: _sneakerCardSeparatorMargin),
            itemCount: 12,
          ),
        ),
      ],
    );
  }
}
