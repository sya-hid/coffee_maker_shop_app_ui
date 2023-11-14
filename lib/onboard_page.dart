import 'package:cold_n_brew/consts.dart';
import 'package:cold_n_brew/home_page.dart';
import 'package:cold_n_brew/models/onboard_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  late final PageController _pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Image.asset(
                    'assets/onboard/${onBoards[index].asset}',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [black, transparent],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  )
                ],
              );
            },
          ),
          Positioned(
            left: 30,
            right: 30,
            top: 50,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: onBoards.length,
                      effect: ExpandingDotsEffect(
                          dotColor: grey.withOpacity(.5),
                          activeDotColor: white,
                          spacing: 5,
                          dotWidth: 15,
                          dotHeight: 5,
                          expansionFactor: 2,
                          radius: 10),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                white.withOpacity(.2))),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                              (route) => false);
                        },
                        child: Text(
                          'Skip',
                          style: roboto,
                        ))
                  ],
                ),
                const SizedBox(height: 70),
                Text(
                  onBoards[currentPage].title,
                  style: roboto.copyWith(
                      fontSize: 32, fontWeight: FontWeight.bold, color: white),
                ),
                const SizedBox(height: 10),
                Text(
                  onBoards[currentPage].subTitle,
                  textAlign: TextAlign.center,
                  style: roboto.copyWith(fontSize: 14, color: white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
