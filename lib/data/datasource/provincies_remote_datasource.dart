import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:project_ktp/domain/entities/provincies_entities.dart';

class GetProvinsi {
  static Future<List<Provinsi>> readJsonData({required String path}) async {
    // read json file
    final jsondata = await rootBundle.loadString(path);
    // decode json data as list
    final list = jsonDecode(jsondata);
    final getList = <Provinsi>[];
    for (var i = 0; i < list.length; i++) {
      getList.add(Provinsi.fromJson(list[i]));
    }

    // map json and initialize
    // using DataModel
    return getList;
  }
}
