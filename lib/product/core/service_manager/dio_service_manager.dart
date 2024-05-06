import 'dart:convert';

import 'package:bloc_simple/product/core/service_manager/model/service_response_model.dart';
import 'package:bloc_simple/product/core/service_manager/service_manager.dart';
import 'package:dio/dio.dart';

final class DioServiceManager extends ServiceManager {
  final Dio _dio = Dio();
  final String _url;
  DioServiceManager(this._url);

  @override
  Future<ServiceResponseModel> get() async {
    final response = await _dio.request(_url);
    return ServiceResponseModel(
        statusCode: response.statusCode,
        body: json.encode(response.data),
        reasonPhrase: response.statusMessage);
  }
}
