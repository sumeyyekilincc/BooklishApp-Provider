import 'dart:convert';
import 'package:books/modals/secondpage_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ControllerSecondPage extends ChangeNotifier {
  News? _news;
  News? get news => _news;
  bool get isBusy => _isBusy;
  bool _isBusy = false;

 ControllerSecondPage() {
    init();
  }
  init() async {
    await fetchNews();
  }

  Future<void> fetchNews() async {
    _isBusy = true;
    notifyListeners();

    var response = await http.get(
      headers: {
        'authorization': "apikey 5zlg2SDxM6dWqrOzUBxNuK:19DK7hZbV8Fb3xluyT9joY",
        'content-type': 'application/json',
      },
      Uri.parse(
          'https://api.collectapi.com/news/getNews?country=tr&tag=general'),
    );
    if (response.statusCode == 200) {
      var parsed = json.decode(response.body);
      _news = News.fromJson(parsed);
    }

    _isBusy = false;
    notifyListeners();
  }
}
