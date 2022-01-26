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
      payments: (json['payments'] as List<dynamic>)
          .map((e) => PaymentDetailsEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      business: json['business'] as String,
      paymentMode: json['paymentMode'] as String,
      activeAmmount: json['activeAmmount'] as int,
      date: DateTime.parse(json['date'] as String),
      party: PaymentPartyDetailsEntity.fromJson(
          json['party'] as Map<String, dynamic>),
      orders: (json['orders'] as List<dynamic>)
          .map((e) =>
              PaymentOrderDetailsEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
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
  val['payments'] = instance.payments.map((e) => e.toJson()).toList();
  val['business'] = instance.business;
  val['paymentMode'] = instance.paymentMode;
  val['activeAmmount'] = instance.activeAmmount;
  val['date'] = instance.date.toIso8601String();
  val['party'] = instance.party.toJson();
  val['orders'] = instance.orders.map((e) => e.toJson()).toList();
  return val;
}
