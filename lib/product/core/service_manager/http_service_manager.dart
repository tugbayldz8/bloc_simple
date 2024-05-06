import 'package:bloc_simple/product/core/service_manager/service_manager.dart';
import 'package:http/http.dart' as http;
import 'model/service_response_model.dart';

final class HttpServiceManager extends ServiceManager {
  HttpServiceManager(this._url);
  final String _url;
  @override
  Future<ServiceResponseModel> get() async {
    final response = await http.get(Uri.parse(_url));
    return ServiceResponseModel(
      statusCode: response.statusCode,
      body: response.body,
      reasonPhrase: response.reasonPhrase,
    );
  }
}
