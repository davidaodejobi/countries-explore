// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:explore/constant/helper/helper.dart';
import 'package:explore/shared/shared.dart';

import '../../constant/constant.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: kToolbarHeight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Explore',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontFamily: 'Pacifico',
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                      const XMargin(1),
                      Text(
                        '.',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontFamily: 'Pacifico',
                              fontWeight: FontWeight.w900,
                              color: AppColor
                                  .logoDotColor, // AppColor.logoDotColor is a constant
                            ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.wb_sunny_outlined,
                    color: AppColor.logoDotColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.0,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  hintText: 'Search',
                  hintStyle: Theme.of(context).textTheme.headline6!.copyWith(
                        color: AppColor.lightGreyColor,
                        fontWeight: FontWeight.w300,
                      ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColor.lightGreyColor,
                    size: 18.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: AppColor.lightGreyColor2,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OptionButton(
                  icon: Icons.language,
                  onTap: () {},
                  text: 'EN',
                ),
                OptionButton(
                  icon: Icons.filter_alt_outlined,
                  onTap: () {},
                  text: 'Filter',
                ),
              ],
            )
          ],
        ).paddingHorizontal(padding: 16),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  const OptionButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30.0,
        margin: const EdgeInsets.only(
          top: 12.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: AppColor.lightGreyColor2,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          boxShadow: const [
            BoxShadow(
              color: AppColor.lightGreyColor2,
              blurRadius: 2.0,
              spreadRadius: 1.0,
              offset: Offset(0.0, 1.0),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColor.lightGreyColor,
              size: 18.0,
            ),
            const XMargin(3),
            Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ).paddingHorizontal(),
      ),
    );
  }
}
