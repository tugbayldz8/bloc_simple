import 'package:http/http.dart' as http;

final class ServiceManager {
  ServiceManager(this.url);

  final String url;

  Future<http.Response> fetch() async {
    final response = await http.get(Uri.parse(url));
    return response;
  }
}
