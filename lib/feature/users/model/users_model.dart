import 'package:bloc_simple/feature/users/model/index.dart';
import 'package:bloc_simple/product/state/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users_model.g.dart';

@JsonSerializable()
final class UsersModel extends BaseModel<UsersModel> {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final AddressModel? address;
  final String? phone;
  final String? website;
  final CompanyModel? company;

  UsersModel(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.address,
      this.phone,
      this.website,
      this.company});

  @override
  UsersModel fromJson(Map<String, dynamic> json) => UsersModel.fromJson(json);

  @override
  List<Object?> get props =>
      [id, name, username, email, address, phone, website, company];

  @override
  Map<String, dynamic> toJson() => _$UsersModelToJson(this);
  factory UsersModel.fromJson(Map<String, dynamic> json) =>
      _$UsersModelFromJson(json);
}
