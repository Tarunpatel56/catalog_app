import 'dart:convert';

import 'package:catalog_app/new/API%20DEMO/model/singlepostmodel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<singlepostmodel?> getSinglePostModel() async {
    try {
      var url = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        singlepostmodel model = singlepostmodel.fromJson(
          jsonDecode(response.body),
        );
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
