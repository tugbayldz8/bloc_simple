import 'dart:convert';
import 'dart:io';
import 'package:bloc_simple/product/core/service_manager/service_manager.dart';
import '../../../../../product/state/base/model/response_model.dart';
import '../../model/index.dart';

final class UsersService {
  UsersService(ServiceManager serviceManager)
      : _serviceManager = serviceManager;
  final ServiceManager _serviceManager;

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
