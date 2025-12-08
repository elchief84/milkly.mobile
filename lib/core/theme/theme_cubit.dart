import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_breastfeeding/core/constants/app_constants.dart';
import 'package:smart_breastfeeding/core/theme/app_theme.dart';

/// Cubit for managing app theme variant
class ThemeCubit extends Cubit<ThemeVariant> {
  final SharedPreferences _prefs;

  ThemeCubit(this._prefs) : super(_loadInitialTheme(_prefs));

  /// Load initial theme from storage
  static ThemeVariant _loadInitialTheme(SharedPreferences prefs) {
    final savedVariant = prefs.getString(AppConstants.keyThemeVariant);

    if (savedVariant == null) {
      return ThemeVariant.neutral;
    }

    return ThemeVariant.values.firstWhere(
      (v) => v.name == savedVariant,
      orElse: () => ThemeVariant.neutral,
    );
  }

  /// Change theme variant and persist to storage
  Future<void> setThemeVariant(ThemeVariant variant) async {
    await _prefs.setString(AppConstants.keyThemeVariant, variant.name);
    emit(variant);
  }

  /// Set theme based on child sex from onboarding
  Future<void> setThemeFromChildSex(String childSex) async {
    final ThemeVariant variant;

    switch (childSex) {
      case 'female':
        variant = ThemeVariant.girl;
        break;
      case 'male':
        variant = ThemeVariant.boy;
        break;
      case 'other':
      default:
        variant = ThemeVariant.neutral;
        break;
    }

    await setThemeVariant(variant);
  }
}
