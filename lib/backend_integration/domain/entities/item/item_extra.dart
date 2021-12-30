import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_extra.g.dart';

@JsonSerializable(explicitToJson: true)
class ItemExtra extends Equatable {
  final double? rate;
  final int pieces;
  final double? labourCharge;
  final String type;

  const ItemExtra({
    this.rate,
    required this.pieces,
    this.labourCharge,
    required this.type,
  });

  factory ItemExtra.fromJson(Map<String, dynamic> json) =>
      _$ItemExtraFromJson(json);
  Map<String, dynamic> toJson() => _$ItemExtraToJson(this);

  @override
  List<Object?> get props => [rate, pieces, labourCharge, type];
}
