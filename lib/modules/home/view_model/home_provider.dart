import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:explore/core/models/countries_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

enum Status { loading, success, error }

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    getFiles();
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

  final Map<String, List<CountryModel>> _countriesMap = {};
  Map<String, List> get countriesMap => _countriesMap;
  List<String> get countriesKeys => _countriesMap.keys.toList();
  List<List<CountryModel>> get countriesValues => _countriesMap.values.toList();
  final scrollController = ScrollController();
  final searchController = TextEditingController();
  Status _status = Status.success;

  Status get status => _status;

  scrollToTop() async {
    await Future.delayed(const Duration(milliseconds: 100));
    SchedulerBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 10000),
          curve: Curves.fastOutSlowIn);
    });
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

  searchCountries(String query) {
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
    // _countries.clear();
    // for (var element in _countriesCopy) {
    //   if (element.name!.common!.toLowerCase().contains(query.toLowerCase())) {
    //     _countries.add(element);
    //   }
    // }

    // groupCountries(_countries);
    // notifyListeners();

    // _countriesCopy.clear();
    List<CountryModel> suggestions = _countriesCopy.where((country) {
      final countryLower = country.name!.common!.toLowerCase();
      final queryLower = query.toLowerCase();
      return countryLower.contains(queryLower);
    }).toList();

    _countries = suggestions;
    // for (var element in _countries) {
    //   log(element.name!.common!);
    // }
    groupCountries(_countries);
    notifyListeners();
  }

  groupCountries(List<CountryModel> countries) {
    log('countries grouped: ${countries.length}');
    Map<String, List<CountryModel>> groupedCountries = {};
    _countriesMap.clear();
    for (var country in countries) {
      log('country: $country');
      String firstLetter = country.name!.common![0].toUpperCase();
      if (groupedCountries.containsKey(firstLetter)) {
        groupedCountries[firstLetter]!.add(country);
      } else {
        groupedCountries[firstLetter] = [country];
      }
      notifyListeners();
    }

    for (var key in groupedCountries.keys.toList()..sort()) {
      _countriesMap[key] = groupedCountries[key]!;
    }
  }

  List<CountryModel> _countries = [];
  final List<CountryModel> _countriesCopy = [];
  List<CountryModel> get countries => _countries;

  Future getFiles() async {
    _status = Status.loading;
    log('_status: $_status');
    try {
      // Response data = await _dio.get('https://restcountries.com/v3.1/all');
      final data =
          await http.get(Uri.parse('https://restcountries.com/v3.1/all'));
      log('data: ${data.statusCode}');
      var parsedData = jsonDecode(data.body);
      final List respose = parsedData;
      var countries = respose.map((e) => CountryModel.fromJson(e)).toList();
      for (var country in countries) {
        _countries.add(country);
        _countriesCopy.add(country);
        // print('country.flags.png: ${country.flags!.png}');
      }
      groupCountries(countries);
      _status = Status.success;
      log('_status: $_status');
      notifyListeners();
      return _countries;
    } catch (e) {
      _status = Status.error;
      log('e: $e');
    }
  }
}


//* search
//* https://restcountries.com/v3.1/name/nigeria?fullText=true
