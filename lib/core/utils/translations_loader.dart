import 'package:flutter/widgets.dart';
import 'package:smart_breastfeeding/core/utils/asset_loader.dart';

/// Loads and manages translations from JSON files
class TranslationsLoader {
  static Map<String, String>? _translations;
  static String _currentLocale = 'it'; // Default to Italian

  /// Load translations for a specific locale
  static Future<void> loadTranslations(String locale) async {
    try {
      final jsonData = await AssetLoader.loadJson(
        'assets/l10n/onboarding_$locale.json',
      );
      _translations = jsonData.map(
        (key, value) => MapEntry(key, value.toString()),
      );
      _currentLocale = locale;
    } catch (e) {
      // Fallback to Italian if loading fails
      if (locale != 'it') {
        await loadTranslations('it');
      }
    }
  }

  /// Get translated string by key
  static String get(String key, {Map<String, String>? params}) {
    if (_translations == null) {
      return key; // Return key if translations not loaded
    }

    var value = _translations![key] ?? key;

    // Replace parameters if any
    if (params != null) {
      params.forEach((paramKey, paramValue) {
        value = value.replaceAll('{$paramKey}', paramValue);
      });
    }

    return value;
  }

  /// Get current locale
  static String get currentLocale => _currentLocale;
}

/// Extension to easily access translations from BuildContext
extension TranslationsExtension on BuildContext {
  String t(String key, {Map<String, String>? params}) {
    return TranslationsLoader.get(key, params: params);
  }
}
