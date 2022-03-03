// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessStatsEntity _$BusinessStatsEntityFromJson(Map<String, dynamic> json) =>
    BusinessStatsEntity(
      totalCategories: json['totalCategories'] as int,
      totalTypes: json['totalTypes'] as int,
      categoryViseType: Map<String, int>.from(json['categoryViseType'] as Map),
    );

Map<String, dynamic> _$BusinessStatsEntityToJson(
        BusinessStatsEntity instance) =>
    <String, dynamic>{
      'totalCategories': instance.totalCategories,
      'totalTypes': instance.totalTypes,
      'categoryViseType': instance.categoryViseType,
    };
