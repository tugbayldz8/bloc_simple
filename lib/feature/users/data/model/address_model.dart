import 'package:json_annotation/json_annotation.dart';
import '../../../../product/state/base/model/base_model.dart';
import 'geo_model.dart';

part 'address_model.g.dart';

@JsonSerializable()
final class AddressModel extends BaseModel<AddressModel> {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final GeoModel? geo;

  AddressModel({this.street, this.suite, this.city, this.zipcode, this.geo});

  @override
  AddressModel fromJson(Map<String, dynamic> json) =>
      AddressModel.fromJson(json);

  @override
  List<Object?> get props => [street, suite, city, zipcode, geo];

  @override
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}
