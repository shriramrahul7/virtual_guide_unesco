import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:virtual_guide/UnescoSite.dart';

class Services {
  static const String localUrl =
      'load_json/world-heritage-list-india-fields.json';

  static Future<List<UnescoSite>> getUnescoSites() async {
    var response = await rootBundle.loadString(localUrl);
    try {
      if (response != null) {
        var list = parseSites(response);
        return list;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<UnescoSite> parseSites(String response) {
    var jsonData = jsonDecode(response.toString()).cast<Map<String, dynamic>>();

    return jsonData
        .map<UnescoSite>((item) => UnescoSite.fromJson(item))
        .toList();
  }
}
