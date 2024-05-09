import 'package:bloc_simple/feature/todos/data/domain/repositories/todos_repository.dart';
import 'package:bloc_simple/feature/users/data/domain/repositories/users_repository.dart';
import 'package:bloc_simple/product/core/service_manager/dio_service_manager.dart';
import 'package:bloc_simple/product/core/service_manager/http_service_manager.dart';
import 'package:get_it/get_it.dart';
import '../../../feature/home/data/domain/repositories/home_repository.dart';

abstract class ProductStateManager {
  static final _getIt = GetIt.I;
  static void setUp() {
    _getIt
      ..registerFactory(() => HomeService(_getIt<HttpServiceManager>(
          param1: 'https://jsonplaceholder.typicode.com/posts')))
      ..registerFactory(() => TodosService(_getIt<DioServiceManager>(
          param1: 'https://jsonplaceholder.typicode.com/todos')))
      ..registerFactory(() => UsersService(_getIt<HttpServiceManager>(
          param1: 'https://jsonplaceholder.typicode.com/users')))
      ..registerFactoryParam<HttpServiceManager, String, Null>(
        (param1, param2) => HttpServiceManager(param1),
      )
      ..registerFactoryParam<DioServiceManager, String, Null>(
          (param1, param2) => DioServiceManager(param1));
  }

  static T read<T extends Object>() => _getIt.get<T>();
}
