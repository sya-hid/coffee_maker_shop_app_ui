import 'package:cold_n_brew/consts.dart';
import 'package:cold_n_brew/models/product_model.dart';
import 'package:cold_n_brew/play_video_page.dart';
import 'package:cold_n_brew/widgets/how_to_pouring_coffee.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final ProductModel product;
  const DetailPage({super.key, required this.product});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: black,
              ),
            ),
            expandedHeight: MediaQuery.of(context).size.height * .6,
            backgroundColor: grey.withOpacity(.1),
            pinned: true,
            collapsedHeight: kToolbarHeight,
            elevation: 0,
            flexibleSpace: Stack(
              clipBehavior: Clip.none,
              children: [
                FlexibleSpaceBar(
                  background: Container(
                    padding: const EdgeInsets.all(50),
                    color: grey.withOpacity(.1),
                    child: Image.asset('assets/${widget.product.image}'),
                  ),
                ),
                Positioned(
                    right: 20,
                    bottom: -75 / 2,
                    child: Container(
                      width: 75,
                      height: 75,
                      decoration:
                          BoxDecoration(color: amber, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        size: 32,
                      ),
                    ))
              ],
            ),
          ),
          SliverList.list(children: [
            const SizedBox(
              height: 75 / 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: '\$',
                    style: roboto.copyWith(
                        fontWeight: FontWeight.bold,
                        color: black,
                        fontSize: 32)),
                TextSpan(
                    text: '${'${widget.product.price}'.split('.')[0]}.',
                    style: roboto.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: black)),
                TextSpan(
                    text:
                        (widget.product.price).toStringAsFixed(2).split('.')[1],
                    style: roboto.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: black)),
              ])),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(widget.product.name,
                  style: roboto.copyWith(
                      fontSize: 20, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(widget.product.subName,
                  style: roboto.copyWith(
                      fontSize: 12,
                      color: black.withOpacity(.5),
                      fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness: 2,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.delivery_dining, color: amber),
                      const SizedBox(width: 5),
                      Text(
                        'Free Dilivery',
                        style: roboto.copyWith(
                            fontSize: 14, color: black.withOpacity(.5)),
                      )
                    ],
                  ),
                  const SizedBox(width: 20),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star_outline_rounded, color: amber),
                      const SizedBox(width: 5),
                      Text(
                        'Rating 4.9 [3.2k]',
                        style: roboto.copyWith(
                            fontSize: 14, color: black.withOpacity(.5)),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.product.description,
                style:
                    roboto.copyWith(height: 1.5, color: black.withOpacity(.5)),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'How to pouring coffee',
                style:
                    roboto.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                  onDoubleTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PlayVideoPage()));
                  },
                  child: const HowToPouringCoffee()),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                howToPouringCoffee,
                style:
                    roboto.copyWith(height: 1.5, color: black.withOpacity(.5)),
              ),
            ),
            const SizedBox(height: 10),
          ])
        ],
      ),
    );
  }
}
