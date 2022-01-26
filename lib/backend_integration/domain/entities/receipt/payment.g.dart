// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentEntity _$PaymentEntityFromJson(Map<String, dynamic> json) =>
    PaymentEntity(
      id: json['_id'] as String?,
      orderId: json['orderId'] as String,
      ammount: json['ammount'] as int,
      invalidated: json['invalidated'] as bool,
    );

Map<String, dynamic> _$PaymentEntityToJson(PaymentEntity instance) {
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
