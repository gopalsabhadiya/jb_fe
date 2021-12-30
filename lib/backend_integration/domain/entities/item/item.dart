import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'item_extra.dart';
import 'labour.dart';

part 'item.g.dart';

String? ignoreIfEmpty(String? value) {
  return value == null || value.isEmpty ? null : value;
}

@JsonSerializable(explicitToJson: true)
class ItemEntity extends Equatable {
  @JsonKey(
    name: "_id",
    required: false,
    includeIfNull: false,
    toJson: ignoreIfEmpty,
  )
  final String? id;
  final int? itemId;
  final String category;
  final String type;
  final String name;
  final double grossWeight;
  final double netWeight;
  final double? carat;
  final Labour? labour;
  final double? itemAmount;
  final double? netAmount;
  final int stockPieces;
  final List<ItemExtra>? extras;
  final String? huid;

  const ItemEntity({
    this.id,
    this.itemId,
    required this.category,
    required this.type,
    required this.name,
    required this.grossWeight,
    required this.netWeight,
    this.carat,
    this.labour,
    this.itemAmount,
    this.netAmount,
    required this.stockPieces,
    this.extras,
    this.huid,
  });

  @override
  List<Object?> get props => [
        id,
        itemId,
        category,
        type,
        name,
        grossWeight,
        netWeight,
        carat,
        itemAmount,
        netAmount,
        stockPieces,
        extras,
        huid,
      ];

  factory ItemEntity.fromJson(Map<String, dynamic> json) =>
      _$ItemEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ItemEntityToJson(this);

  static List<ItemEntity> fromJsonToList(List<dynamic> json) {
    for (int i = 0; i < json.length; i++) {
      ItemEntity.fromJson(json[i]);
    }
    return List<ItemEntity>.from(
      json.map(
        (party) => ItemEntity.fromJson(party),
      ),
    );
  }
}
