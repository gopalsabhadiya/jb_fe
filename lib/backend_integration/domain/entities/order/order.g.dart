// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderEntity _$OrderEntityFromJson(Map<String, dynamic> json) => OrderEntity(
      id: json['_id'] as String?,
      orderId: json['orderId'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => ItemEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      gst: (json['gst'] as List<dynamic>)
          .map((e) => GSTEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      scrap: json['scrap'] == null
          ? null
          : ScrapEntity.fromJson(json['scrap'] as Map<String, dynamic>),
      receipts:
          (json['receipts'] as List<dynamic>).map((e) => e as String).toList(),
      netAmmount: (json['netAmmount'] as num).toDouble(),
      totalAmmount: (json['totalAmmount'] as num).toDouble(),
      scrapAmmount: (json['scrapAmmount'] as num?)?.toDouble(),
      finalAmmount: (json['finalAmmount'] as num).toDouble(),
      kasar: (json['kasar'] as num?)?.toDouble(),
      billOutstanding: (json['billOutstanding'] as num).toDouble(),
      party: json['party'] as String,
      fulfilled: json['fulfilled'] as bool,
      date: DateTime.parse(json['date'] as String),
      goldRate: (json['goldRate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OrderEntityToJson(OrderEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', ignoreIfEmpty(instance.id));
  val['orderId'] = instance.orderId;
  val['items'] = instance.items.map((e) => e.toJson()).toList();
  val['gst'] = instance.gst.map((e) => e.toJson()).toList();
  val['scrap'] = instance.scrap?.toJson();
  val['receipts'] = instance.receipts;
  val['netAmmount'] = instance.netAmmount;
  val['totalAmmount'] = instance.totalAmmount;
  val['scrapAmmount'] = instance.scrapAmmount;
  val['finalAmmount'] = instance.finalAmmount;
  val['kasar'] = instance.kasar;
  val['billOutstanding'] = instance.billOutstanding;
  val['party'] = instance.party;
  val['fulfilled'] = instance.fulfilled;
  val['date'] = instance.date.toIso8601String();
  val['goldRate'] = instance.goldRate;
  return val;
}
