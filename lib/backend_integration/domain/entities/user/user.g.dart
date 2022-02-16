// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      id: json['_id'] as String?,
      name: json['name'] as String,
      email: json['email'] as String,
      business: json['business'] as String,
      verified: json['verified'] as bool,
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', ignoreIfEmpty(instance.id));
  val['name'] = instance.name;
  val['email'] = instance.email;
  val['business'] = instance.business;
  val['verified'] = instance.verified;
  return val;
}
