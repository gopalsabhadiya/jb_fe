// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiptDetailsEntity _$ReceiptDetailsEntityFromJson(
        Map<String, dynamic> json) =>
    ReceiptDetailsEntity(
      id: json['_id'] as String,
      receiptId: json['receiptId'] as String,
      ammount: (json['ammount'] as num).toDouble(),
      activeAmmount: (json['activeAmmount'] as num).toDouble(),
      party: ReceiptPartyDetailsEntity.fromJson(
          json['party'] as Map<String, dynamic>),
      paymentMode: json['paymentMode'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$ReceiptDetailsEntityToJson(
    ReceiptDetailsEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', ignoreIfEmpty(instance.id));
  val['receiptId'] = instance.receiptId;
  val['ammount'] = instance.ammount;
  val['activeAmmount'] = instance.activeAmmount;
  val['party'] = instance.party.toJson();
  val['paymentMode'] = instance.paymentMode;
  val['date'] = instance.date.toIso8601String();
  return val;
}
