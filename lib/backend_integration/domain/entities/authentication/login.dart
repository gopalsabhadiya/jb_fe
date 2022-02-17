import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginEntity extends Equatable {
  final String email;
  final String password;

  const LoginEntity({
    required this.email,
    required this.password,
  });

  factory LoginEntity.fromJson(Map<String, dynamic> json) =>
      _$LoginEntityFromJson(json);
  Map<String, dynamic> toJson() => _$LoginEntityToJson(this);

  @override
  List<Object?> get props => [email, password];

  @override
  String toString() {
    return 'LoginEntity{ email: $email, password: $password}';
  }
}
