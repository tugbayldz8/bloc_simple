import 'package:json_annotation/json_annotation.dart';
import '../../../../product/state/base/model/base_model.dart';

part 'geo_model.g.dart';

@JsonSerializable()
final class GeoModel extends BaseModel<GeoModel> {
  final String? lat;
  final String? lng;

  GeoModel({this.lat, this.lng});

  @override
  GeoModel fromJson(Map<String, dynamic> json) => GeoModel.fromJson(json);

  @override
  List<Object?> get props => [lat, lng];

  @override
  Map<String, dynamic> toJson() => _$GeoModelToJson(this);

  factory GeoModel.fromJson(Map<String, dynamic> json) =>
      _$GeoModelFromJson(json);
}
