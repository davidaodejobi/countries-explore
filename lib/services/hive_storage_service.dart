import 'dart:developer';

import 'package:hive/hive.dart';

class HiveStorageService {
  var box = Hive.box('settings');

  void storeItem({required String key, required var value}) async {
    await box.put(key, value);
    log('stored $value in $key');
  }

  Future<dynamic> readItem({required String key}) async {
    final value = await box.get(key);
    log('read $value from $key');
    return value;
  }

  void deleteItem({required String key}) async {
    log('deleted $key');
    await box.delete(key);
  }
}
