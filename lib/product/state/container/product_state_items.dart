import 'package:bloc_simple/feature/home/service/home_service.dart';
import 'package:bloc_simple/feature/todos/service/todos_service.dart';
import 'package:bloc_simple/feature/users/service/users_service.dart';
import 'package:bloc_simple/product/state/container/product_state_manager.dart';

final class ProductStateItems {
  static UsersService get userService =>
      ProductStateManager.read<UsersService>();
  static TodosService get todosService =>
      ProductStateManager.read<TodosService>();
  static HomeService get homeService => ProductStateManager.read<HomeService>();
}
