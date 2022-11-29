import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Map<String, String> headers = {"Accept": "application/json"};

  Future getApi(url) async {
    var data;
    var baseUrl = Uri.parse(url);

    await http.get(baseUrl, headers: headers).then((response) {
      if (response.statusCode == 200) {
        data = json.decode(response.body.toString());
      }
    });
    return data;
  }
}
