import 'package:json_annotation/json_annotation.dart';
import '../../../product/core/base/model/base_model.dart';

part 'company_model.g.dart';

@JsonSerializable()
final class CompanyModel extends BaseModel<CompanyModel> {
  final String? name;
  final String? catchPharse;
  final String? bs;

  CompanyModel({this.name, this.catchPharse, this.bs});

  @override
  CompanyModel fromJson(Map<String, dynamic> json) =>
      CompanyModel.fromJson(json);

  @override
  List<Object?> get props => [name, catchPharse, bs];

  @override
  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);
}
