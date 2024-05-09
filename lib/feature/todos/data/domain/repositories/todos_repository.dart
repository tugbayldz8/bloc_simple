import 'dart:convert';
import 'dart:io';
import 'package:bloc_simple/product/state/base/model/response_model.dart';

import '../../../../../product/core/service_manager/service_manager.dart';
import '../../model/todos_model.dart';

final class TodosService {
  TodosService(ServiceManager serviceManager)
      : _serviceManager = serviceManager;
  final ServiceManager _serviceManager;
  Future<ResponseModel<List<Todos>>> fetchTodos() async {
    final response = await _serviceManager.get();
    if (response.statusCode == HttpStatus.ok) {
      List decodeData = json.decode(response.body!);
      final data = decodeData.map((e) => Todos.fromJson(e)).toList();
      return ResponseModel<List<Todos>>(data: data);
    } else {
      return ResponseModel(error: response.reasonPhrase);
    }
  }
}
