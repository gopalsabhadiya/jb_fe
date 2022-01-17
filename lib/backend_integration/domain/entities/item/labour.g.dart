// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'labour.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LabourEntity _$LabourEntityFromJson(Map<String, dynamic> json) => LabourEntity(
      value: (json['value'] as num?)?.toDouble(),
      type: $enumDecode(_$LabourTypeEnumEnumMap, json['type']),
    );

Map<String, dynamic> _$LabourEntityToJson(LabourEntity instance) =>
    <String, dynamic>{
      'value': instance.value,
      'type': _$LabourTypeEnumEnumMap[instance.type],
    };

const _$LabourTypeEnumEnumMap = {
  LabourTypeEnum.PERCENTAGE: 'PERCENTAGE',
  LabourTypeEnum.PER_GRAM: 'PER_GRAM',
  LabourTypeEnum.TOTAL: 'TOTAL',
};
