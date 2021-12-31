// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankEntity _$BankEntityFromJson(Map<String, dynamic> json) => BankEntity(
      id: json['_id'] as String,
      name: json['name'] as String,
      accountNo: json['accountNo'] as int,
      ifsc: json['ifsc'] as String,
      branch: json['branch'] as String,
    );

Map<String, dynamic> _$BankEntityToJson(BankEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', ignoreIfEmpty(instance.id));
  val['name'] = instance.name;
  val['accountNo'] = instance.accountNo;
  val['ifsc'] = instance.ifsc;
  val['branch'] = instance.branch;
  return val;
}
