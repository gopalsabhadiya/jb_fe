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
  final String? itemId;
  final String category;
  final String type;
  final String name;
  final double grossWeight;
  final double netWeight;
  final double? carat;
  final LabourEntity? labour;
  final double? itemAmount;
  final double? netAmount;
  final int? stockPieces;
  final List<ItemExtraEntity>? extras;
  final String? huid;
  final bool? hasImages;
  final int? pieces;

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
    this.stockPieces,
    this.extras,
    this.huid,
    this.hasImages,
    this.pieces,
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
        hasImages,
        pieces,
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
        (item) => ItemEntity.fromJson(item),
      ),
    );
  }

  @override
  String toString() {
    return 'ItemEntity{id: $id, itemId: $itemId, category: $category, type: $type, name: $name, grossWeight: $grossWeight, netWeight: $netWeight, carat: $carat, labour: $labour, itemAmount: $itemAmount, netAmount: $netAmount, stockPieces: $stockPieces, extras: $extras, huid: $huid, hasImages: $hasImages, pieces: $pieces}';
  }
}
