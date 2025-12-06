import 'package:flutter/widgets.dart';
import 'package:smart_breastfeeding/l10n/app_localizations.dart';

/// Extension to easily access localizations from BuildContext
extension L10nExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

