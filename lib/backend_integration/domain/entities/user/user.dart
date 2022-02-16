import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

String? ignoreIfEmpty(String? value) {
  return value == null || value.isEmpty ? null : value;
}

@JsonSerializable()
class UserEntity {
  @JsonKey(
    name: "_id",
    required: false,
    includeIfNull: false,
    toJson: ignoreIfEmpty,
  )
  final String? id;
  final String name;
  final String email;
  final String business;
  final bool verified;

  const UserEntity({
    this.id,
    required this.name,
    required this.email,
    required this.business,
    required this.verified,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  @override
  String toString() {
    return 'User{name: $name, email: $email, business: $business, verified: $verified}';
  }
}
