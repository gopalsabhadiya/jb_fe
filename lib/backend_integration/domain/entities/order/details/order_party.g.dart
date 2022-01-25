// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_party.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderPartyEntity _$OrderPartyEntityFromJson(Map<String, dynamic> json) =>
    OrderPartyEntity(
      id: json['_id'] as String,
      name: json['name'] as String,
      contactNo: json['contactNo'] as String,
    );

Map<String, dynamic> _$OrderPartyEntityToJson(OrderPartyEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', ignoreIfEmpty(instance.id));
  val['name'] = instance.name;
  val['contactNo'] = instance.contactNo;
  return val;
}
