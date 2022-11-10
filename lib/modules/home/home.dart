// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:explore/modules/details/details.dart';
import 'package:flutter/material.dart';

import 'package:explore/shared/shared.dart';

import '../../constant/constant.dart';
import '../../core/models/countries.dart';
import 'widgets/widgets.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  groupCountries() {
    List countries = dummuyCountries;
    //group countries by first letter
    Map<String, List> groupedCountries = {};
    for (var country in countries) {
      String firstLetter = country.name[0].toUpperCase();
      if (groupedCountries.containsKey(firstLetter)) {
        groupedCountries[firstLetter]!.add(country);
      } else {
        groupedCountries[firstLetter] = [country];
      }
    }

    Map<String, List> sortedMap = {};
    for (var key in groupedCountries.keys.toList()..sort()) {
      sortedMap[key] = groupedCountries[key]!;
    }

    //print grouped countries
    log('key: ${sortedMap.keys.length}');
    for (var key in sortedMap.keys) {
      log('key: $key');
      for (var country in sortedMap[key]!) {
        log('country: ${country.name}');
      }
    }

    //print grouped countries in linear time
  }

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
                  onTap: () {
                    groupCountries();
                  },
                  text: 'Filter',
                ),
              ],
            ),
            const YMargin(10),
            Expanded(
              child: ListView.builder(
                itemCount: dummuyCountries.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'A',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: AppColor.lightGreyColor,
                            ),
                      ),
                      const YMargin(10),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Details(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            const XMargin(10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Country Name',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                const YMargin(5),
                                Text(
                                  'Country Capital',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        // fontWeight: FontWeight.w300,
                                        color: AppColor.lightGreyColor,
                                      ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const YMargin(10),
                    ],
                  );
                },
              ),
            ),
          ],
        ).paddingHorizontal(padding: 16),
      ),
    );
  }
}
