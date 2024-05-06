import 'model/service_response_model.dart';

abstract class ServiceManager {
  Future<ServiceResponseModel> get();
}
