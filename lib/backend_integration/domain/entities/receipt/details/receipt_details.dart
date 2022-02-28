import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/constants/enum/payment_mode_enum.dart';
import 'package:jb_fe/backend_integration/domain/entities/receipt/details/receipt_party_details.dart';
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
  final String id;
  final String receiptId;
  final double ammount;
  final double activeAmmount;
  final ReceiptPartyDetailsEntity party;
  final PaymentModeEnum paymentMode;
  final DateTime date;

  const ReceiptDetailsEntity({
    required this.id,
    required this.receiptId,
    required this.ammount,
    required this.activeAmmount,
    required this.party,
    required this.paymentMode,
    required this.date,
  }) : super();

  @override
  List<Object?> get props => [
        id,
        receiptId,
        ammount,
        party,
        activeAmmount,
        paymentMode,
        date,
      ];

  factory ReceiptDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$ReceiptDetailsEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ReceiptDetailsEntityToJson(this);

  static List<ReceiptDetailsEntity> fromJsonToList(List<dynamic> json) {
    for (int i = 0; i < json.length; i++) {
      final ReceiptDetailsEntity entity =
          ReceiptDetailsEntity.fromJson(json[i]);
    }
    return List<ReceiptDetailsEntity>.from(
      json.map(
        (receipt) => ReceiptDetailsEntity.fromJson(receipt),
      ),
    );
  }
}
