// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gst.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GSTEntity _$GSTEntityFromJson(Map<String, dynamic> json) => GSTEntity(
      id: json['_id'] as String?,
      value: (json['value'] as num).toDouble(),
      type: $enumDecode(_$GSTTypeEnumEnumMap, json['type']),
      ammount: (json['ammount'] as num).toDouble(),
    );

Map<String, dynamic> _$GSTEntityToJson(GSTEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', ignoreIfEmpty(instance.id));
  val['value'] = instance.value;
  val['type'] = _$GSTTypeEnumEnumMap[instance.type];
  val['ammount'] = instance.ammount;
  return val;
}

const _$GSTTypeEnumEnumMap = {
  GSTTypeEnum.CGST: 'CGST',
  GSTTypeEnum.SGST: 'SGST',
  GSTTypeEnum.UTGST: 'UTGST',
  GSTTypeEnum.IGST: 'IGST',
};
