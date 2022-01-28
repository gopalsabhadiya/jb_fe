// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_party_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiptPartyDetailsEntity _$ReceiptPartyDetailsEntityFromJson(
        Map<String, dynamic> json) =>
    ReceiptPartyDetailsEntity(
      id: json['_id'] as String?,
      partyId: json['partyId'] as String,
      name: json['name'] as String,
      contactNo: json['contactNo'] as String,
    );

Map<String, dynamic> _$ReceiptPartyDetailsEntityToJson(
    ReceiptPartyDetailsEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', ignoreIfEmpty(instance.id));
  val['partyId'] = instance.partyId;
  val['name'] = instance.name;
  val['contactNo'] = instance.contactNo;
  return val;
}
