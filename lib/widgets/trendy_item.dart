import 'package:cold_n_brew/consts.dart';
import 'package:flutter/material.dart';

class TrendyProductItem extends StatelessWidget {
  final String image;
  const TrendyProductItem({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
            color: grey.withOpacity(.2),
            borderRadius: BorderRadius.circular(5)),
        child: Image.asset('assets/$image'));
  }
}
