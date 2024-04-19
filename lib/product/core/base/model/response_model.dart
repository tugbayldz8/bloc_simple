import '../../../../feature/home/model/post_model.dart';

final class ResponseModel<E> {
  final E? data;
  final String? error;
  ResponseModel({this.data, this.error});
}
