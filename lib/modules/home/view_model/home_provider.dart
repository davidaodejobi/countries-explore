import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:explore/core/models/countries_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    //? hide and show the loading scroll button--- great to have after completing the app
    //  scrollController..addListener(() {
    //     setState(() {
    //       if (_scrollController.offset >= 400) {
    //         _showBackToTopButton = true; // show the back-to-top button
    //       } else {
    //         _showBackToTopButton = false; // hide the back-to-top button
    //       }
    //     });
    //   });
  }

  final Dio _dio = Dio();
  final Map<String, List<CountryModel>> _countriesMap = {};
  Map<String, List> get countriesMap => _countriesMap;
  List<String> get countriesKeys => _countriesMap.keys.toList();
  List<List<CountryModel>> get countriesValues => _countriesMap.values.toList();
  final scrollController = ScrollController();
  final searchController = TextEditingController();

  scrollToTop() async {
    await Future.delayed(const Duration(milliseconds: 100));
    SchedulerBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 10000),
          curve: Curves.fastOutSlowIn);
    });
    notifyListeners();
    // scrollController.animateTo(
    //   0.0,
    //   curve: Curves.easeOut,
    //   duration: const Duration(milliseconds: 100),
    // );
  }

  scrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    SchedulerBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 10000),
        curve: Curves.slowMiddle,
      );
    });
    notifyListeners();
  }

  /*
    List<SomeName> academy = <SomeName>[];
  ///this is going to be the default list that 
  ///will get most of the work done
  List<SomeName> academyOrigin = <SomeName>[];
  ///this is the list that will be used to search
  ///and filter the list

  searchAcademy({String search}) {
    academy.clear();
    ///this is going to clear the list
    academyOrigin.forEach((element) {
      ///this is going to loop through the list
      ///and check if the name of the academy
      ///contains the search
      if (element.name.toLowerCase().contains(search.toLowerCase())) {
        academy.add(element);
      }
    });
    notifyListeners();
    ///notifyListeners makes sure that the widget is 
    ///rebuilt and the list is updated
  }
  */

  searchCountries(String query) async {
    // _countriesCopy.clear();
    // if (query.isNotEmpty) {
    //   for (int i = 0; i < _countries.length; i++) {
    //     if (_countries[i]
    //         .name!
    //         .common!
    //         .toLowerCase()
    //         .contains(query.toLowerCase())) {
    //       _countriesCopy.add(_countries[i]);
    //     }
    //   }
    // }
    _countries.clear();
    for (var element in _countriesCopy) {
      if (element.name!.common!.toLowerCase().contains(query.toLowerCase())) {
        _countries.add(element);
      }
    }

    groupCountries(_countries);
    notifyListeners();
  }

  groupCountries(List<CountryModel> countries) {
    Map<String, List<CountryModel>> groupedCountries = {};
    for (var country in countries) {
      String firstLetter = country.name!.common![0].toUpperCase();
      if (groupedCountries.containsKey(firstLetter)) {
        groupedCountries[firstLetter]!.add(country);
      } else {
        groupedCountries[firstLetter] = [country];
      }
    }

    for (var key in groupedCountries.keys.toList()..sort()) {
      _countriesMap[key] = groupedCountries[key]!;
    }
  }

  final List<CountryModel> _countries = [];
  final List<CountryModel> _countriesCopy = [];
  List<CountryModel> get countries => _countries;

  Future getFiles() async {
    try {
      Response data = await _dio.get('https://restcountries.com/v3.1/all');
      final List parsedData = data.data;
      var countries = parsedData.map((e) => CountryModel.fromJson(e)).toList();
      for (var country in countries) {
        _countries.add(country);
        _countriesCopy.add(country);
        // print('country.flags.png: ${country.flags!.png}');
      }
      groupCountries(countries);
      return _countries;
    } catch (e) {
      log('e: $e');
    }
  }
}


//* search
//* https://restcountries.com/v3.1/name/nigeria?fullText=true
