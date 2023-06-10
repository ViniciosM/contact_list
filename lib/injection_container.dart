import 'package:contact_list_app/repositories/contact_list_repository.dart';
import 'package:contact_list_app/repositories/contact_list_repository_impl.dart';
import 'package:contact_list_app/services/contact_list_service.dart';
import 'package:contact_list_app/services/contact_list_service_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // HTTP
  sl.registerSingleton<Dio>(sl());

  // Controllers

  // Repositories
  sl.registerLazySingleton<ContactListRepository>(
      () => ContactListRepositoryImpl(dio: sl()));

  // Services
  sl.registerLazySingleton<ContactListService>(
      () => ContactListServiceImpl(contactListRepository: sl()));
}
