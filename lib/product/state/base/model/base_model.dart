import 'package:equatable/equatable.dart';

abstract class BaseModel<E> extends Equatable {
  E fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
