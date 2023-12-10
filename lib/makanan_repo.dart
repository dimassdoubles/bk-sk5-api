import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:studi_kasus_02/makanan.dart';

class MakananRepo {
  late final Dio _dio;
  MakananRepo() {
    _dio = Dio();
  }
  Future<List<Makanan>> getListMakanan() async {
    try {
      final response =
          await _dio.get("https://bengkelkoding.dinus.ac.id/food/");

      debugPrint("${response.data}");

      List<Makanan> result = [];
      for (final json in jsonDecode(response.data)) {
        result.add(Makanan.fromJson(json));
      }

      return result;
    } catch (e) {
      debugPrint("$e");
      rethrow;
    }
  }
}
