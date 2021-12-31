// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'labour.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LabourEntity _$LabourEntityFromJson(Map<String, dynamic> json) => LabourEntity(
      value: (json['value'] as num?)?.toDouble(),
      type: json['type'] as String,
    );

Map<String, dynamic> _$LabourEntityToJson(LabourEntity instance) =>
    <String, dynamic>{
      'value': instance.value,
      'type': instance.type,
    };
