import 'package:bloc_simple/product/state/container/product_state_items.dart';
import 'package:bloc_simple/product/state/container/product_state_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    ProductStateManager.setUp();
  });
  test('Service Manager', () async {
    final responseTodos = await ProductStateItems.todosService.fetchTodos();
    expect(responseTodos.data, isNotEmpty);

    final responsePosts = await ProductStateItems.homeService.fetch();
    expect(responsePosts.data, isNotEmpty);
  });
}
