import 'dart:convert';

import 'package:fetch_data/models/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailFetch with ChangeNotifier {
  List<Welcome> _detail = [];

  List<Welcome> get detail {
    return [..._detail];
  }

  Future<void> getdata() async {
    final raw = await http.get(Uri.parse(
        'https://script.google.com/macros/s/AKfycbyQleqIElUg-WQ8HmfO8Qi6oI7d28jlyDn2kb1Iyf6YSs8dJyV1iw73oylg3Xip5HEAQA/exec'));

    try {
      final jsondetail = jsonDecode(raw.body.toString()) as List<dynamic>;
      final List<Welcome> loadeddetail = [];

      for (var value in jsondetail) {
        print(value);
        loadeddetail.add(Welcome(
            name: value['NAME'],
            w: value['W'],
            s1: value['S1'],
            s2: value['S2'],
            a1: value['A1'],
            a2: value['A2'],
            a3: value['A3'],
            a4: value['A4'],
            tracking: value['TRACKING'],
            tracking2: value['TRACKING2'],
            billing: value['BILLING'],
            decs: value['DECS'],
            referanceno1: value['REFERANCENO1'],
            referanceno2: value['REFERANCENO2'],
            lastData: value['LAST_DATA'],
            lastData2: value['LAST_DATA2'],
            maxi: value['MAXI'],
            country: value['COUNTRY']));
        _detail = loadeddetail;
        notifyListeners();
      }
    } catch (error) {
      return;
    }
  }
}
