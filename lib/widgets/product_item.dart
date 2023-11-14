import 'package:cold_n_brew/consts.dart';
import 'package:cold_n_brew/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: black.withOpacity(.1),
                offset: const Offset(3, 3),
                blurRadius: 20)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: grey.withOpacity(.2),
                  borderRadius: BorderRadius.circular(5)),
              child: Image.asset(
                'assets/${product.image}',
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            product.name,
            style: roboto.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            product.subName,
            style: roboto.copyWith(
              color: black.withOpacity(.6),
              fontSize: 14,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    '\$',
                    style: roboto.copyWith(fontSize: 12, color: amber),
                  ),
                  Text(
                    product.price.toStringAsFixed(2),
                    style: roboto.copyWith(
                      color: amber,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: black,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add),
              )
            ],
          )
        ],
      ),
    );
  }
}
