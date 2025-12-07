[![CI](https://github.com/elchief84/milkly.mobile/actions/workflows/ci.yml/badge.svg)](https://github.com/elchief84/milkly.mobile/actions/workflows/ci.yml)
[![Code Quality](https://github.com/elchief84/milkly.mobile/actions/workflows/code-quality.yml/badge.svg)](https://github.com/elchief84/milkly.mobile/actions/workflows/code-quality.yml)
[![Firebase App Distribution](https://github.com/elchief84/milkly.mobile/actions/workflows/firebase-distribution.yml/badge.svg)](https://github.com/elchief84/milkly.mobile/actions/workflows/firebase-distribution.yml)

# Milkly

Breastfeeding tracking utility for new parents.

## Run

```bash
flutter pub get
flutter run
```

## Localization

Supported languages: **English (en)**, **Italian (it)**

Strings are in `lib/l10n/app_*.arb`. After editing, run:
```bash
flutter pub get  # Regenerates localizations
```

## Architecture

Clean Architecture con:
- **State Management**: flutter_bloc (Bloc/Cubit)
- **DI**: get_it
- **Navigation**: go_router con shell route + bottom nav
- **Storage**: drift (SQLite) + shared_preferences + flutter_secure_storage

### Navigation Structure

```
First Launch → Onboarding (fullscreen, modal)
                    ↓ (complete)
              Main App (bottom nav):
              ├── Home (dashboard + timer)
              ├── Plan (feeding plan & schedule)
              ├── Growth (baby growth tracking)
              └── Settings (preferences)
```

### Folder Structure

```
lib/
├── core/
│   ├── constants/      # App constants
│   ├── di/            # Dependency injection
│   ├── navigation/    # Router + bottom nav
│   ├── theme/         # Material 3 theme
│   └── utils/         # Helpers
├── features/
│   ├── home/presentation/pages/
│   ├── plan/presentation/pages/
│   ├── growth/presentation/pages/
│   ├── settings/presentation/pages/
│   └── onboarding/presentation/pages/
├── shared/            # Reusable widgets/models
├── app.dart           # Main app widget
└── main.dart          # Entry point
```

## Code Generation

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```
