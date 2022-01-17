// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scrap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScrapEntity _$ScrapEntityFromJson(Map<String, dynamic> json) => ScrapEntity(
      id: json['_id'] as String?,
      netWeight: (json['netWeight'] as num).toDouble(),
      touch: (json['touch'] as num).toDouble(),
      rate: (json['rate'] as num).toDouble(),
      netAmmount: (json['netAmmount'] as num).toDouble(),
    );

Map<String, dynamic> _$ScrapEntityToJson(ScrapEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', ignoreIfEmpty(instance.id));
  val['netWeight'] = instance.netWeight;
  val['touch'] = instance.touch;
  val['rate'] = instance.rate;
  val['netAmmount'] = instance.netAmmount;
  return val;
}
