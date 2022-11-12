import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:explore/core/models/countries_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class HomeProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  final Map<String, List<CountryModel>> _countriesMap = {};
  Map<String, List> get countriesMap => _countriesMap;
  List<String> get countriesKeys => _countriesMap.keys.toList();
  List<List<CountryModel>> get countriesValues => _countriesMap.values.toList();
  final scrollController = ScrollController();

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
  List<CountryModel> get countries => _countries;

  Future getFiles() async {
    try {
      Response data = await _dio.get('https://restcountries.com/v3.1/all');
      final List parsedData = data.data;
      var countries = parsedData.map((e) => CountryModel.fromJson(e)).toList();
      for (var country in countries) {
        _countries.add(country);
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
