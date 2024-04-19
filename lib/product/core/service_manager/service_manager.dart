import 'package:http/http.dart' as http;

import 'model/service_response_model.dart';

final class ServiceManager {
  ServiceManager(this._url);

  final String _url;

  Future<ServiceResponseModel> get() async {
    final response = await http.get(Uri.parse(_url));
    return ServiceResponseModel(
      statusCode: response.statusCode,
      body: response.body,
      reasonPhrase: response.reasonPhrase,
    );
  }
}
