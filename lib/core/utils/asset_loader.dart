import 'dart:convert';
import 'package:flutter/services.dart';

/// Helper class for loading assets
class AssetLoader {
  AssetLoader._();

  /// Load and parse JSON file from assets
  static Future<Map<String, dynamic>> loadJson(String path) async {
    final String jsonString = await rootBundle.loadString(path);
    return json.decode(jsonString) as Map<String, dynamic>;
  }

  /// Load and parse JSON array from assets
  static Future<List<dynamic>> loadJsonArray(String path) async {
    final String jsonString = await rootBundle.loadString(path);
    return json.decode(jsonString) as List<dynamic>;
  }

  /// Load string from assets
  static Future<String> loadString(String path) async {
    return await rootBundle.loadString(path);
  }
}
