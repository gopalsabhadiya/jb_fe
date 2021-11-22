import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String name;
  final String email;
  final String business;
  final bool verified;

  const User(this.name, this.email, this.business, this.verified);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User{name: $name, email: $email, business: $business, verified: $verified}';
  }

  static const empty = User("-", "-", "-", false);
}
