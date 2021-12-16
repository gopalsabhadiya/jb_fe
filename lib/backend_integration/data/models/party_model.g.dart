// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'party_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartyModel _$PartyModelFromJson(Map<String, dynamic> json) => PartyModel(
      id: json['_id'] as String,
      partyId: json['partyId'] as int,
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
      user: json['user'] as String,
      business: json['business'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$PartyModelToJson(PartyModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'partyId': instance.partyId,
      'name': instance.name,
      'contactNo': instance.contactNo,
      'gstin': instance.gstin,
      'balance': instance.balance,
      'address': instance.address,
      'email': instance.email,
      'type': _$PartyTypeEnumEnumMap[instance.type],
      'panNo': instance.panNo,
      'aadharNo': instance.aadharNo,
      'order': instance.order,
      'user': instance.user,
      'business': instance.business,
      'date': instance.date.toIso8601String(),
    };

const _$PartyTypeEnumEnumMap = {
  PartyTypeEnum.Customer: 'Customer',
  PartyTypeEnum.Retail: 'Retail',
};
