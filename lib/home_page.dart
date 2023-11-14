import 'package:cold_n_brew/consts.dart';
import 'package:cold_n_brew/detail_page.dart';
import 'package:cold_n_brew/models/categories_model.dart';
import 'package:cold_n_brew/models/product_model.dart';
import 'package:cold_n_brew/widgets/trendy_item.dart';
import 'package:cold_n_brew/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentCategory = 'All';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white.withOpacity(.9),
      appBar: AppBar(
        backgroundColor: black,
        elevation: 0,
        leading: const Icon(Icons.menu),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 10),
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.notifications_outlined),
              Positioned(
                right: 5,
                top: 20,
                child: Icon(
                  Icons.circle,
                  color: Colors.red,
                  size: 7,
                ),
              ),
            ],
          ),
          SizedBox(width: 30),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .4,
            color: black,
          ),
          ListView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Find your best\n',
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                      ))),
                  TextSpan(
                      text: 'coffee maker ',
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ))),
                  TextSpan(
                      text: 'style',
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                      )))
                ])),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: CarouselSlider.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index, realIndex) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                          product: products[index],
                                        )));
                          },
                          child: ProductItem(
                            product: products[index],
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                        clipBehavior: Clip.none,
                        viewportFraction: .7,
                        padEnds: false,
                        enlargeCenterPage: true,
                        enlargeFactor: .3,
                        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        height: MediaQuery.of(context).size.height * .5)),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Trendy Products',
                  style: roboto.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  ...List.generate(
                      categories.length,
                      (index) => Padding(
                            padding: index == 0
                                ? const EdgeInsets.only(left: 30, right: 20)
                                : index == categories.length - 1
                                    ? const EdgeInsets.only(right: 30)
                                    : const EdgeInsets.only(right: 20),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentCategory = categories[index];
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    border: currentCategory == categories[index]
                                        ? Border.all(
                                            color: black.withOpacity(.5))
                                        : const Border(),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  categories[index],
                                  style: roboto.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: black.withOpacity(.6)),
                                ),
                              ),
                            ),
                          ))
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: CarouselSlider(
                    items: List.generate(
                        products.length,
                        (index) => TrendyProductItem(
                              image: products[index].image,
                            )),
                    options: CarouselOptions(
                      viewportFraction: .5,
                      padEnds: false,
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
