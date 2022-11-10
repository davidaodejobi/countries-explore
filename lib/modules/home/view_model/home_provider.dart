import 'dart:developer';

import 'package:explore/core/models/countries.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  groupCountries() {
    List countries = dummuyCountries;
    //group countries by first letter
    Map<String, List> groupedCountries = {};
    for (var country in countries) {
      String firstLetter = country['name'][0].toUpperCase();
      if (groupedCountries.containsKey(firstLetter)) {
        groupedCountries[firstLetter]!.add(country);
      } else {
        groupedCountries[firstLetter] = [country];
      }
    }
    log('groupedCountries: $groupedCountries');
  }
}
