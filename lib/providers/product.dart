import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorites;

  void _updateStatus(bool oldStatus) {
    isFavorites = oldStatus;
    notifyListeners();
  }

  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      this.isFavorites = false});

  Future<void> toggleFavoriteStatus(String token, String userId) async {
    final oldStatus = isFavorites;
    isFavorites = !isFavorites;
    notifyListeners();

    final url =
        'https://flutter-update.firebaseio.com/userFavorites/$userId/$id.json?auth=$token';

    try {
      final response = await http.put(
        url,
        body: json.encode(
          isFavorites,
        ),
      );

      if (response.statusCode >= 400) {
        _updateStatus(oldStatus);
      }
    } catch (error) {
      _updateStatus(oldStatus);
    }
  }
}
