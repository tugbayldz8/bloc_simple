import 'package:bloc_simple/feature/home/service/home_service.dart';
import 'package:bloc_simple/feature/todos/service/todos_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Service Manager', () async {
    final responseTodos = await TodosService().fetchTodos();
    expect(responseTodos.data, isNotEmpty);

    final responsePosts = await HomeService().fetch();
    expect(responsePosts.data, isNotEmpty);
  });
}
