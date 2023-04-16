import 'package:flutter/material.dart';
import 'package:kyla_task/models/SneakerModel.dart';

class AnimatedSneakerCard extends StatefulWidget {
  final SneakerModel sneaker;
  final VoidCallback onPressed;

  static const colorsMap = <int, Color>{
    1: Colors.blue,
    2: Colors.deepOrange,
    3: Colors.lightGreen,
    4: Colors.pink,
  };

  const AnimatedSneakerCard({
    required this.sneaker,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedSneakerCard> createState() => _AnimatedSneakerCardState();
}

class _AnimatedSneakerCardState extends State<AnimatedSneakerCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final containerWidth = MediaQuery.of(context).size.width * 0.85;

    return Container(
      color: Colors.white,
      width: containerWidth,
      child: Stack(
        children: [
          Stack(
            children: [
              Hero(
                tag: 'sneaker_${widget.sneaker.id}color',
                child: Container(
                  width: containerWidth - 110,
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: AnimatedSneakerCard.colorsMap[widget.sneaker.id] ?? Colors.blue,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.sneaker.brandName,
                            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400, decoration: TextDecoration.none),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            widget.sneaker.productName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '\$ ${widget.sneaker.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              const Positioned(
                right: 20.0,
                bottom: 20.0,
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              )
            ],
          ),
          Positioned(
            right: -5.0,
            bottom: 80,
            child: SizedBox(
              width: containerWidth - 80,
              child: GestureDetector(
                onTapDown: (_) => setState(() => _isPressed = true),
                onTapUp: (_) {
                  setState(() => _isPressed = false);
                  widget.onPressed();
                },
                onTapCancel: () => setState(() => _isPressed = false),
                child: Hero(
                  tag: 'sneaker_${widget.sneaker.id}',
                  child: AnimatedPadding(
                    curve: Curves.linear,
                    duration: const Duration(milliseconds: 400),
                    padding: EdgeInsets.symmetric(
                      horizontal: _isPressed ? 30 : 0,
                      vertical: _isPressed ? 12 : 0,
                    ),
                    child: Image(
                      image: AssetImage(widget.sneaker.imagePath),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
