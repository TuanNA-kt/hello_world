import 'package:api_client/rest_client.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hello_world/common/app_const.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_repository/user_repository.dart';

import '../firebase_options.dart';

final GetIt sl = GetIt.instance;

Future<void> setupDependencies() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  sl.registerLazySingleton<SharedPreferences>(() => prefs);

  sl.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 3000),
      ),
    ),
  );

  sl.registerLazySingleton<ApiClient>(() => ApiClient(sl<Dio>()));

  sl.registerLazySingleton<ApiService>(
    () => ApiService(
      apiClient: sl<ApiClient>(),
      apiKey: dotenv.env['IMGBB_API_KEY']!,
    ),
  );

  sl.registerLazySingleton<ChatRemoteDataSource>(() => ChatRemoteDataSource());

  sl.registerLazySingleton<ChatRepository>(
    () => ChatRepository(
      remoteDataSource: sl<ChatRemoteDataSource>(),
      apiService: sl<ApiService>(),
    ),
  );

  sl.registerLazySingleton<UserRepository>(
    () => UserRepository(
      prefs: sl<SharedPreferences>(),
      chatRemoteDataSource: sl<ChatRemoteDataSource>(),
    ),
  );
}
