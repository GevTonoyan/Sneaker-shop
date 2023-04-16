import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kyla_task/models/SneakerModel.dart';
import 'package:kyla_task/ui/sneaker/widgets/animated_button.dart';
import 'package:kyla_task/ui/sneaker/view_models/sneaker_view_model.dart';
import 'package:kyla_task/ui/sneaker/widgets/sneaker_size_card.dart';

class SneakerScreen extends StatelessWidget {
  final SneakerModel sneaker;
  final Color themeColor;

  const SneakerScreen({
    required this.sneaker,
    required this.themeColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SneakerViewModel viewModel = Get.put(SneakerViewModel());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: themeColor,
        title: Center(
          child: Text(
            sneaker.brandName,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        actions: const [
          Icon(Icons.favorite_border),
          SizedBox(
            width: 24,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 320,
            child: Stack(
              children: [
                Hero(
                  tag: 'sneaker_${sneaker.id}color',
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: themeColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(240),
                        bottomRight: Radius.circular(80),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: -10.0,
                  child: SizedBox(
                    height: 350,
                    child: Hero(
                      tag: 'sneaker_${sneaker.id}',
                      child: Image(
                        image: AssetImage(sneaker.imagePath),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 12,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.grey.shade200,
                  ),
                  child: const Image(
                    image: AssetImage('assets/sneakers/sneaker_01.png'),
                  ),
                );
              },
            ),
          ),
          const Divider(
            color: Colors.black,
            height: 8,
            thickness: 0.7,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          sneaker.productName,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '\$ ${sneaker.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      sneaker.description,
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'MORE DETAILS',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: const [
                        Text(
                          'Size',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'US',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text('UK'),
                        SizedBox(width: 8),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 35,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: viewModel.availableSizes.length,
                        itemBuilder: (context, index) {
                          return SneakerSizeCard(
                            size: viewModel.availableSizes[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 8);
                        },
                      ),
                    ),
                    const SizedBox(height: 32),
                    AnimatedButton(
                        text: 'ADD TO BAG',
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
