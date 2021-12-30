// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'labour.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Labour _$LabourFromJson(Map<String, dynamic> json) => Labour(
      value: (json['value'] as num).toDouble(),
      type: json['type'] as String,
    );

Map<String, dynamic> _$LabourToJson(Labour instance) => <String, dynamic>{
      'value': instance.value,
      'type': instance.type,
    };
