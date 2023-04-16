import 'package:flutter/material.dart';
import 'package:kyla_task/models/SneakerModel.dart';

class StandardSneakerCard extends StatelessWidget {
  final SneakerModel sneaker;

  const StandardSneakerCard({
    required this.sneaker,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.grey.shade200,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RotatedBox(
                quarterTurns: 3,
                child: Material(
                  elevation: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.red.withOpacity(0.4),
                          blurRadius: 1,
                          offset: const Offset(-4, 0),
                        ),
                      ],
                    ),
                    child: const Text(
                      'NEW',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                )),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage(sneaker.imagePath)),
                Text(
                  '${sneaker.brandName} ${sneaker.productName}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text('\$ ${sneaker.price.toStringAsFixed(2)}')
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.favorite_border),
          )
        ],
      ),
    );
  }
}
