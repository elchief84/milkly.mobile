import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final getIt = GetIt.instance;

/// Initialize dependency injection
Future<void> configureDependencies() async {
  // Register SharedPreferences for simple flags
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // Register FlutterSecureStorage for sensitive data
  const secureStorage = FlutterSecureStorage();
  getIt.registerSingleton<FlutterSecureStorage>(secureStorage);

  // Future: Register Drift database, repositories, use cases, blocs, etc.
  // This will be populated as we add features
}
