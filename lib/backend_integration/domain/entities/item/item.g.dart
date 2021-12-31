// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemEntity _$ItemEntityFromJson(Map<String, dynamic> json) => ItemEntity(
      id: json['_id'] as String?,
      itemId: json['itemId'] as String?,
      category: json['category'] as String,
      type: json['type'] as String,
      name: json['name'] as String,
      grossWeight: (json['grossWeight'] as num).toDouble(),
      netWeight: (json['netWeight'] as num).toDouble(),
      carat: (json['carat'] as num?)?.toDouble(),
      labour: json['labour'] == null
          ? null
          : LabourEntity.fromJson(json['labour'] as Map<String, dynamic>),
      itemAmount: (json['itemAmount'] as num?)?.toDouble(),
      netAmount: (json['netAmount'] as num?)?.toDouble(),
      stockPieces: json['stockPieces'] as int,
      extras: (json['extras'] as List<dynamic>?)
          ?.map((e) => ItemExtraEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      huid: json['huid'] as String?,
    );

Map<String, dynamic> _$ItemEntityToJson(ItemEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', ignoreIfEmpty(instance.id));
  val['itemId'] = instance.itemId;
  val['category'] = instance.category;
  val['type'] = instance.type;
  val['name'] = instance.name;
  val['grossWeight'] = instance.grossWeight;
  val['netWeight'] = instance.netWeight;
  val['carat'] = instance.carat;
  val['labour'] = instance.labour?.toJson();
  val['itemAmount'] = instance.itemAmount;
  val['netAmount'] = instance.netAmount;
  val['stockPieces'] = instance.stockPieces;
  val['extras'] = instance.extras?.map((e) => e.toJson()).toList();
  val['huid'] = instance.huid;
  return val;
}
