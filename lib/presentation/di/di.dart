import 'package:catinder/domain/usecases/get_liked_cats_usecase.dart';
import 'package:catinder/tools/error_handler.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../data/services/cat_api_client.dart';
import '../../data/services/cat_repository_impl.dart';
import '../../data/services/local_database.dart';
import '../../data/services/local_repository_impl.dart';
import '../../domain/repositories/cat_repository.dart';
import '../../domain/repositories/local_repository.dart';
import '../../domain/usecases/delete_liked_cat_usecase.dart';
import '../../domain/usecases/fetch_cats_usecase.dart';
import '../../domain/usecases/get_api_key_usecase.dart';
import '../../domain/usecases/save_api_key_usecase.dart';
import '../../domain/usecases/save_liked_cat_usecase.dart';
import '../navigation/navigation_service.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton(() => FlutterSecureStorage());

  final apiKey = dotenv.env['API_KEY'] ?? '';
  if (apiKey.isEmpty) {
    ErrorHandler.recordError(
      "API_KEY not found in storage",
      StackTrace.current,
    );
  }

  getIt.registerLazySingleton<CatApiClient>(() {
    return CatApiClient(apiKey: apiKey);
  });

  getIt.registerLazySingleton<CatRepository>(() {
    final apiClient = getIt.get<CatApiClient>();
    return CatRepositoryImpl(apiClient: apiClient);
  });

  getIt.registerLazySingleton(() => FetchCatsUseCase(getIt<CatRepository>()));
  getIt.registerLazySingleton(
    () => GetApiKeyUseCase(getIt<FlutterSecureStorage>()),
  );
  getIt.registerLazySingleton(
    () => SaveApiKeyUseCase(getIt<FlutterSecureStorage>()),
  );

  getIt.registerLazySingleton(() => NavigationService());

  getIt.registerLazySingleton(() => LocalDatabase());

  getIt.registerLazySingleton<LocalRepository>(() {
    return LocalRepositoryImpl(getIt<LocalDatabase>());
  });

  getIt.registerLazySingleton(
    () => GetLikedCatsUseCase(getIt<LocalRepository>()),
  );
  getIt.registerLazySingleton(
    () => SaveLikedCatUseCase(getIt<LocalRepository>()),
  );
  getIt.registerLazySingleton(
    () => DeleteLikedCatUseCase(getIt<LocalRepository>()),
  );
}
