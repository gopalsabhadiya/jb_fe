// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_gold_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyGoldRateEntity _$DailyGoldRateEntityFromJson(Map<String, dynamic> json) =>
    DailyGoldRateEntity(
      id: json['_id'] as String?,
      rate: json['rate'] as int,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$DailyGoldRateEntityToJson(DailyGoldRateEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', ignoreIfEmpty(instance.id));
  val['rate'] = instance.rate;
  val['date'] = instance.date.toIso8601String();
  return val;
}
