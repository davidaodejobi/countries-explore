// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:explore/core/core.dart';
import 'package:flutter/material.dart';

import 'package:explore/shared/shared.dart';
import 'package:provider/provider.dart';

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
            const CustomAppbar(),
            Consumer(builder: (context, AppTheme value, child) {
              return SizedBox(
                height: 40.0,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    hintText: 'Search',
                    hintStyle: Theme.of(context).textTheme.headline6!.copyWith(
                          color: value.isDarkTheme
                              ? Theme.of(context).iconTheme.color
                              : AppColor.lightGreyColor,
                          fontWeight: FontWeight.w300,
                        ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: value.isDarkTheme
                          ? Theme.of(context).iconTheme.color
                          : AppColor.lightGreyColor,
                      size: 18.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: value.isDarkTheme
                        ? AppColor.darkPlanetBgColor.withOpacity(0.2)
                        : AppColor.lightGreyColor2,
                  ),
                ),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OptionButton(
                  icon: Icons.language,
                  onTap: () {
                    showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Language',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                  Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  )
                                ],
                              ),
                              const YMargin(20),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceEvenly,
                              //   children: [
                              //     LanguageButton(
                              //       language: 'English',
                              //       onTap: () {},
                              //     ),
                              //     LanguageButton(
                              //       language: 'French',
                              //       onTap: () {},
                              //     ),
                              //     LanguageButton(
                              //       language: 'Spanish',
                              //       onTap: () {},
                              //     ),
                              //   ],
                              // ),
                              const YMargin(20),
                            ],
                          ).paddingAll(
                            padding: 16.0,
                          );
                        });
                  },
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
                  return const ListOfCountries();
                },
              ),
            ),
          ],
        ).paddingHorizontal(padding: 16),
      ),
    );
  }
}
