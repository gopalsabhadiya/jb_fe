// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_extra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemExtraEntity _$ItemExtraEntityFromJson(Map<String, dynamic> json) =>
    ItemExtraEntity(
      rate: (json['rate'] as num?)?.toDouble(),
      pieces: json['pieces'] as int?,
      labourCharge: (json['labourCharge'] as num?)?.toDouble(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$ItemExtraEntityToJson(ItemExtraEntity instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'pieces': instance.pieces,
      'labourCharge': instance.labourCharge,
      'type': instance.type,
    };
