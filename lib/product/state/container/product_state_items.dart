import 'package:bloc_simple/feature/todos/data/domain/repositories/todos_repository.dart';
import 'package:bloc_simple/feature/users/data/domain/repositories/users_repository.dart';
import 'package:bloc_simple/product/state/container/product_state_manager.dart';
import '../../../feature/home/data/domain/repositories/home_repository.dart';

final class ProductStateItems {
  static UsersService get userService =>
      ProductStateManager.read<UsersService>();
  static TodosService get todosService =>
      ProductStateManager.read<TodosService>();
  static HomeService get homeService => ProductStateManager.read<HomeService>();
}
