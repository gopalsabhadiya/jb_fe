// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailsEntity _$OrderDetailsEntityFromJson(Map<String, dynamic> json) =>
    OrderDetailsEntity(
      id: json['_id'] as String,
      orderId: json['orderId'] as String,
      totalAmmount: (json['totalAmmount'] as num).toDouble(),
      billOutstanding: (json['billOutstanding'] as num).toDouble(),
      party: OrderPartyEntity.fromJson(json['party'] as Map<String, dynamic>),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$OrderDetailsEntityToJson(OrderDetailsEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', ignoreIfEmpty(instance.id));
  val['orderId'] = instance.orderId;
  val['totalAmmount'] = instance.totalAmmount;
  val['billOutstanding'] = instance.billOutstanding;
  val['date'] = instance.date.toIso8601String();
  val['party'] = instance.party.toJson();
  return val;
}
