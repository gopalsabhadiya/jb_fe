// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiptDetailsEntity _$ReceiptDetailsEntityFromJson(
        Map<String, dynamic> json) =>
    ReceiptDetailsEntity(
      id: json['_id'] as String?,
      receiptId: json['receiptId'] as String?,
      ammount: (json['ammount'] as num).toDouble(),
      activeAmmount: (json['activeAmmount'] as num).toDouble(),
      partyName: json['partyName'] as String,
      partyContactNo: json['partyContactNo'] as String,
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
  val['partyName'] = instance.partyName;
  val['partyContactNo'] = instance.partyContactNo;
  val['paymentMode'] = instance.paymentMode;
  val['date'] = instance.date.toIso8601String();
  return val;
}
