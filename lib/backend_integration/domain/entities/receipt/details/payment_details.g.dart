// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentDetailsEntity _$PaymentDetailsEntityFromJson(
        Map<String, dynamic> json) =>
    PaymentDetailsEntity(
      id: json['_id'] as String?,
      orderId: json['orderId'] as String,
      ammount: json['ammount'] as int,
      invalidated: json['invalidated'] as bool,
    );

Map<String, dynamic> _$PaymentDetailsEntityToJson(
    PaymentDetailsEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', ignoreIfEmpty(instance.id));
  val['orderId'] = instance.orderId;
  val['ammount'] = instance.ammount;
  val['invalidated'] = instance.invalidated;
  return val;
}
