import 'package:json_annotation/json_annotation.dart';

part 'business_stats.g.dart';

@JsonSerializable()
class BusinessStatsEntity {
  final int totalCategories;
  final int totalTypes;
  final Map<String, int> categoryViseType;

  const BusinessStatsEntity({
    required this.totalCategories,
    required this.totalTypes,
    required this.categoryViseType,
  });

  factory BusinessStatsEntity.fromJson(Map<String, dynamic> json) =>
      _$BusinessStatsEntityFromJson(json);
  Map<String, dynamic> toJson() => _$BusinessStatsEntityToJson(this);

  @override
  String toString() {
    return 'BusinessStatsEntity{totalCategories: $totalCategories, totalTypes: $totalTypes, categoryViseType: $categoryViseType}';
  }
}
