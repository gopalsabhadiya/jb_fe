// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_order_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentOrderDetailsEntity _$PaymentOrderDetailsEntityFromJson(
        Map<String, dynamic> json) =>
    PaymentOrderDetailsEntity(
      id: json['_id'] as String?,
      orderId: json['orderId'] as String,
      finalAmmount: json['finalAmmount'] as int,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$PaymentOrderDetailsEntityToJson(
    PaymentOrderDetailsEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', ignoreIfEmpty(instance.id));
  val['orderId'] = instance.orderId;
  val['finalAmmount'] = instance.finalAmmount;
  val['date'] = instance.date.toIso8601String();
  return val;
}
