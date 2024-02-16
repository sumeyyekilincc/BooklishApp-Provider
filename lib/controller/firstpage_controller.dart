import 'dart:convert';
import 'package:books/modals/firstpage_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ControllerFirstPage extends ChangeNotifier {
  NewBook? _newbook;
  NewBook? get newbook => _newbook;
  bool get isBusy => _isBusy;
  bool _isBusy = false;

  ControllerFirstPage() {
    init();
  }
  init() async {
    await fetchNewBook();
  }

  Future<void> fetchNewBook() async {
    _isBusy = true;
    notifyListeners();

    var response = await http.get(
      Uri.parse("https://api.collectapi.com/book/newBook"),
      headers: {
        'authorization': "apikey 5zlg2SDxM6dWqrOzUBxNuK:19DK7hZbV8Fb3xluyT9joY",
        'content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var parsed = json.decode(response.body);
      _newbook = NewBook.fromJson(parsed);
    }

    _isBusy = false;
    notifyListeners();
  }
}
