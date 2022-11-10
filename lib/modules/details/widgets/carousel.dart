import 'dart:async';

import 'package:explore/modules/details/widgets/carousel_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constant/constant.dart';

class Carousel extends StatefulWidget {
  const Carousel({
    Key? key,
  }) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final controller = PageController(initialPage: 0, keepPage: true);
  int _currentPage = 0;
  Timer? _timer;
  final images = [
    'https://picsum.photos/200/300',
    'https://picsum.photos/400/400',
    'https://picsum.photos/300/500',
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage <= images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
              controller: controller,
              itemCount: images.length,
              allowImplicitScrolling: true,
              itemBuilder: (context, index) {
                return Container(
                  height: 200,
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(images[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
          Positioned(
            right: 16,
            child: CarouselButton(
              icon: Icons.arrow_forward_ios,
              onPressed: () {
                if (_currentPage <= images.length) {
                  _currentPage++;
                } else {
                  _currentPage = 0;
                }

                controller.animateToPage(
                  _currentPage,
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeIn,
                );
              },
            ),
          ),
          Positioned(
            left: 16,
            child: CarouselButton(
              icon: Icons.arrow_back_ios,
              onPressed: () {
                if (_currentPage >= 0) {
                  _currentPage--;
                } else {
                  _currentPage = images.length;
                }

                controller.animateToPage(
                  _currentPage,
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeIn,
                );
              },
            ),
          ),
          Positioned(
            bottom: 16,
            child: SmoothPageIndicator(
              controller: controller,
              count: images.length,
              effect: const WormEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: Colors.white,
                dotColor: AppColor.lightGreyColor,
                spacing: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
