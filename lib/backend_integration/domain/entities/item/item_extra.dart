import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_extra.g.dart';

@JsonSerializable(explicitToJson: true)
class ItemExtraEntity extends Equatable {
  final double? rate;
  final int? pieces;
  final double? labourCharge;
  final String? type;

  const ItemExtraEntity({
    this.rate,
    this.pieces,
    this.labourCharge,
    this.type,
  });

  factory ItemExtraEntity.fromJson(Map<String, dynamic> json) =>
      _$ItemExtraEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ItemExtraEntityToJson(this);

  @override
  List<Object?> get props => [rate, pieces, labourCharge, type];

  @override
  String toString() {
    return 'ItemExtraEntity{rate: $rate, pieces: $pieces, labourCharge: $labourCharge, type: $type}';
  }
}
