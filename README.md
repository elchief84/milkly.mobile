# Milkly

Breastfeeding tracking utility for new parents.

## Run

```bash
flutter pub get
flutter run
```

## Architecture

Clean Architecture con:
- **State Management**: flutter_bloc (Bloc/Cubit)
- **DI**: get_it
- **Navigation**: go_router (da configurare)
- **Storage**: drift (SQLite) + shared_preferences + flutter_secure_storage

```
lib/
├── core/           # Constants, theme, DI, errors, utils
├── features/       # Feature modules (domain/data/presentation)
├── shared/         # Reusable widgets e models
├── app.dart        # Main app widget
└── main.dart       # Entry point
```

## Code Generation

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```
