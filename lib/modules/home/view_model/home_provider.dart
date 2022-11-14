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
  }

  final List<String> _continent = [];
  final List<String> _timeZones = [];
  List<CountryModel> _countries = [];
  final List<CountryModel> _countriesCopy = [];
  final scrollController = ScrollController();
  final searchController = TextEditingController();
  final Map<String, List<CountryModel>> _countriesMap = {};
  final List<bool> _isExpanded = [false, false];
  Status get status => _status;
  // final StorageProvider _storageService = StorageProvider();

  List<Map<String, dynamic>> _continentTracker = [];
  List<Map<String, dynamic>> _timeZonesTracker = [];
  List<Map<String, dynamic>> get timeZonesTracker => _timeZonesTracker;
  List<Map<String, dynamic>> get continentTracker => _continentTracker;
  List<CountryModel> get countries => _countries;
  Map<String, List> get countriesMap => _countriesMap;
  List<String> get countriesKeys => _countriesMap.keys.toList();
  List<List<CountryModel>> get countriesValues => _countriesMap.values.toList();
  Status _status = Status.success;
  List<bool> get isExpanded => _isExpanded;

  filterTracker() {
    _continentTracker = List.generate(
        _continent.length,
        (index) => {
              'key': _continent[index],
              'selected': false,
            });

    _timeZonesTracker = List.generate(
        _timeZones.length,
        (index) => {
              'key': _timeZones[index],
              'selected': false,
            });
  }

  toggleFilterTracker(int index) {
    _continentTracker[index]['selected'] =
        !_continentTracker[index]['selected'];
    notifyListeners();
  }

  someMethod() {
    _status = Status.loading;
    List<CountryModel> bob = [];
    List temp = [];
    log(_countries.isEmpty.toString());
    log('_countriesCopy: ${_countriesCopy.length}');
    // bool isAllUnchecked = true;
    // // _continentTracker.where((element) => () {});
    // for (var con in _continentTracker) {
    //   if (con['selected'] == true) {
    //     isAllUnchecked = false;
    //     break;
    //   }
    // }
    for (var element in _continentTracker) {
      if (element['selected'] == true) {
        temp.add(true);
      }
    }
    _countries.clear();
    if (temp.isEmpty) {
      _countries = _countriesCopy;
    } else {
      for (int i = 0; i < _continentTracker.length; i++) {
        if (_continentTracker[i]['selected'] == true) {
          // print(_continentTracker[i]['key']);
          // print('_countriesCopy: $_countriesCopy');
          List<CountryModel> filter = _countriesCopy.where((country) {
            final continentLower = country.continents!.first.toLowerCase();
            final filterLower = _continentTracker[i]['key'].toLowerCase();
            return continentLower.contains(filterLower);
          }).toList();
          _countries.addAll(filter);
          print('filter: $filter');
          bob = filter;
        }
        // _countries.add();
      }
    }
    groupCountries(_countries);
    _status = Status.success;
    notifyListeners();
  }

  expand(int index) {
    _isExpanded[index] = !_isExpanded[index];
    notifyListeners();
  }

  scrollToTop() async {
    await Future.delayed(const Duration(milliseconds: 100));
    SchedulerBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 10000),
          curve: Curves.fastOutSlowIn);
    });
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
    groupCountries(_countries);
    notifyListeners();
  }

  groupCountries(List<CountryModel> countries) {
    Map<String, List<CountryModel>> groupedCountries = {};
    _countriesMap.clear();
    for (var country in countries) {
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

  Future getFiles() async {
    _status = Status.loading;
    log('_status: $_status');
    try {
      final data =
          await http.get(Uri.parse('https://restcountries.com/v3.1/all'));
      log('data: ${data.statusCode}');
      var parsedData = jsonDecode(data.body);
      final List respose = parsedData;
      var countries = respose.map((e) => CountryModel.fromJson(e)).toList();
      for (var country in countries) {
        _countries.add(country);
        _countriesCopy.add(country);
        if (_continent.contains(country.continents![0])) {
          continue;
        } else {
          _continent.add(country.continents![0]);
        }
      }

      for (var country in countries) {
        if (_timeZones.contains(country.timezones![0])) {
          continue;
        } else {
          _timeZones.add(country.timezones![0]);
        }
      }
      // _storageService.storeItem(key: 'countries', value: _countries);
      filterTracker();
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
