// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:explore/modules/details/widgets/carousel_button.dart';

import '../../../constant/constant.dart';

class Carousel extends StatefulWidget {
  final List<String> images;
  const Carousel({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final controller = PageController(initialPage: 0, keepPage: true);
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    final images = widget.images;
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
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
              itemCount: widget.images.length,
              allowImplicitScrolling: true,
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  imageUrl: widget.images[index],
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    height: 200,
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(widget.images[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                      .animate(onPlay: (controller) => controller.repeat())
                      .shimmer(
                        curve: Curves.slowMiddle,
                        color: Theme.of(context).cardColor.withOpacity(0.6),
                        duration: const Duration(seconds: 1),
                      ),
                );
              }),
          Positioned(
            right: 16,
            child: CarouselButton(
              icon: Icons.arrow_forward_ios,
              onPressed: () {
                if (_currentPage <= widget.images.length) {
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
                  _currentPage = widget.images.length;
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
              count: widget.images.length,
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
