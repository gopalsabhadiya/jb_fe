// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_party_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentPartyDetailsEntity _$PaymentPartyDetailsEntityFromJson(
        Map<String, dynamic> json) =>
    PaymentPartyDetailsEntity(
      name: json['name'] as String,
      contactNo: json['contactNo'] as String,
      address: json['address'] as String,
      gstin: json['gstin'] as String,
    );

Map<String, dynamic> _$PaymentPartyDetailsEntityToJson(
        PaymentPartyDetailsEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'contactNo': instance.contactNo,
      'address': instance.address,
      'gstin': instance.gstin,
    };
