// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'party_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartyModel _$PartyModelFromJson(Map<String, dynamic> json) => PartyModel(
      id: json['_id'] as String?,
      partyId: json['partyId'] as int?,
      name: json['name'] as String,
      contactNo: json['contactNo'] as String,
      gstin: json['gstin'] as String?,
      balance: (json['balance'] as num).toDouble(),
      address: json['address'] as String?,
      email: json['email'] as String?,
      type: $enumDecode(_$PartyTypeEnumEnumMap, json['type']),
      panNo: json['panNo'] as String?,
      aadharNo: json['aadharNo'] as String?,
      order:
          (json['order'] as List<dynamic>?)?.map((e) => e as String).toList(),
      user: json['user'] as String?,
      business: json['business'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$PartyModelToJson(PartyModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', ignoreIfEmpty(instance.id));
  val['partyId'] = instance.partyId;
  val['name'] = instance.name;
  val['contactNo'] = instance.contactNo;
  writeNotNull('gstin', ignoreIfEmpty(instance.gstin));
  val['balance'] = instance.balance;
  writeNotNull('address', ignoreIfEmpty(instance.address));
  writeNotNull('email', ignoreIfEmpty(instance.email));
  val['type'] = _$PartyTypeEnumEnumMap[instance.type];
  writeNotNull('panNo', ignoreIfEmpty(instance.panNo));
  writeNotNull('aadharNo', ignoreIfEmpty(instance.aadharNo));
  writeNotNull('order', instance.order);
  writeNotNull('user', instance.user);
  writeNotNull('business', instance.business);
  writeNotNull('date', instance.date?.toIso8601String());
  return val;
}

const _$PartyTypeEnumEnumMap = {
  PartyTypeEnum.Customer: 'Customer',
  PartyTypeEnum.Retail: 'Retail',
};
