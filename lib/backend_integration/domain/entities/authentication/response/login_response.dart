import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginResponseEntity extends Equatable {
  final String token;
  final bool subscriptionExpired;

  const LoginResponseEntity({
    required this.token,
    required this.subscriptionExpired,
  });

  factory LoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseEntityToJson(this);

  @override
  List<Object?> get props => [token, subscriptionExpired];

  @override
  String toString() {
    return 'LoginResponseEntity{token: $token, subscriptionExpired: $subscriptionExpired}';
  }
}
