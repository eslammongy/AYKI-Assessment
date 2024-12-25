import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShapesDataSource {
  /// Fetches orders from a JSON file.
  Future<List<dynamic>> fetchDataFromFile() async {
    try {
      // Simulate network delay
      await Future.delayed(Duration(seconds: 1));
      final shapesJson = await rootBundle.loadString('assets/shapes.json');
      final shapes = json.decode(shapesJson);
      return shapes;
    } catch (e) {
      throw Exception("Failed to fetch shapes data");
    }
  }
}

final dataSourceProvider = Provider<ShapesDataSource>((ref) {
  return ShapesDataSource();
});
