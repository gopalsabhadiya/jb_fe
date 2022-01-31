// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiptEntity _$ReceiptEntityFromJson(Map<String, dynamic> json) =>
    ReceiptEntity(
      id: json['_id'] as String?,
      receiptId: json['receiptId'] as String?,
      ammount: (json['ammount'] as num).toDouble(),
      payments: (json['payments'] as List<dynamic>)
          .map((e) => PaymentEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      party: json['party'] as String,
      business: json['business'] as String,
      user: json['user'] as String,
      invalidated: json['invalidated'] as bool,
      paymentMode: json['paymentMode'] as String,
      bank: json['bank'] as String?,
      check: json['check'] as int?,
      pan: json['pan'] as String?,
      aadhar: json['aadhar'] as int?,
      activeAmmount: (json['activeAmmount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$ReceiptEntityToJson(ReceiptEntity instance) {
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
  val['party'] = instance.party;
  val['business'] = instance.business;
  val['user'] = instance.user;
  val['invalidated'] = instance.invalidated;
  val['paymentMode'] = instance.paymentMode;
  val['bank'] = instance.bank;
  val['check'] = instance.check;
  val['pan'] = instance.pan;
  val['aadhar'] = instance.aadhar;
  val['activeAmmount'] = instance.activeAmmount;
  val['date'] = instance.date.toIso8601String();
  return val;
}
