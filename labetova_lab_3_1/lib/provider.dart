import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Pokemon {
  final String name;
  final int height;
  final int weight;

Pokemon({
  required this.name,
  required this.height,
  required this.weight,
  });

 factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
    );
  }
}

class InputProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Pokemon? _data;
  Pokemon? get data => _data;

  Future<void> fetchStatusCode(url) async {
    _isLoading = true;
    notifyListeners();
    String myURL='https://pokeapi.co/api/v2/pokemon/${url}';
    final response = await http.get(Uri.parse(myURL));
    _data = Pokemon.fromJson(jsonDecode(response.body));
    _isLoading = false;
    notifyListeners();
  }
}