import 'dart:convert';
import 'dart:io';

import 'package:bloc_simple/product/core/base/model/response_model.dart';
import 'package:bloc_simple/product/core/service_manager/service_manager.dart';

import '../model/post_model.dart';

class HomeService {
  final serviceManager =
      ServiceManager('https://jsonplaceholder.typicode.com/posts');

  Future<ResponseModel> fetch() async {
    final response = await serviceManager.get();
    if (response.statusCode == HttpStatus.ok) {
      List decodeData = json.decode(response.body!);
      final data = decodeData.map((e) => Post.fromJson(e)).toList();
      return ResponseModel<List<Post>>(data: data);
    } else {
      return ResponseModel(error: response.reasonPhrase);
    }
  }
}
