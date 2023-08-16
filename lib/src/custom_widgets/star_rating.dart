import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final double size;
  final Color emptyColor;
  final Color filledColor;

  const StarRating({
    super.key,
    required this.rating,
    this.size = 24.0,
    this.emptyColor = Colors.grey,
    this.filledColor = Colors.yellow,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < rating.floor() ? Icons.star : Icons.star_border,
          size: size,
          color: index < rating.floor() ? filledColor : emptyColor,
        );
      }),
    );
  }
}
