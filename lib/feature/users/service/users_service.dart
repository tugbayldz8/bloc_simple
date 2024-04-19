import 'dart:convert';
import 'dart:io';

import 'package:bloc_simple/product/core/service_manager/service_manager.dart';
import '../../../product/core/base/model/response_model.dart';
import '../model/index.dart';

final class UsersService {
  final _serviceManager =
      ServiceManager('https://jsonplaceholder.typicode.com/users');
  Future<ResponseModel<List<UsersModel>>> fetchUsers() async {
    final response = await _serviceManager.get();
    if (response.statusCode == HttpStatus.ok) {
      List decodeData = json.decode(response.body!);
      final data = decodeData
          .map((e) => UsersModel.fromJson(e))
          .cast<UsersModel>()
          .toList();
      return ResponseModel(data: data);
    }
    return ResponseModel(error: response.reasonPhrase);
  }
}
