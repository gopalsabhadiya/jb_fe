import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'receipt_details.g.dart';

String? ignoreIfEmpty(String? value) {
  return value == null || value.isEmpty ? null : value;
}

@JsonSerializable(explicitToJson: true)
class ReceiptDetailsEntity extends Equatable {
  @JsonKey(
    name: "_id",
    required: false,
    includeIfNull: false,
    toJson: ignoreIfEmpty,
  )
  final String? id;
  final String? receiptId;
  final double ammount;
  final double activeAmmount;
  final String partyName;
  final String partyContactNo;
  final String paymentMode;
  final DateTime date;

  const ReceiptDetailsEntity({
    this.id,
    this.receiptId,
    required this.ammount,
    required this.activeAmmount,
    required this.partyName,
    required this.partyContactNo,
    required this.paymentMode,
    required this.date,
  }) : super();

  @override
  List<Object?> get props => [
        id,
        receiptId,
        ammount,
        partyName,
        partyContactNo,
        activeAmmount,
        paymentMode,
        date,
      ];

  factory ReceiptDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$ReceiptDetailsEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ReceiptDetailsEntityToJson(this);
}
