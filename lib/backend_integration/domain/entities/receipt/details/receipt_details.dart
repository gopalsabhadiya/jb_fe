import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/entities/receipt/details/payment_details.dart';
import 'package:jb_fe/backend_integration/domain/entities/receipt/details/payment_order_details.dart';
import 'package:jb_fe/backend_integration/domain/entities/receipt/details/payment_party_details.dart';
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
  final List<PaymentDetailsEntity> payments;
  final String business;
  final String paymentMode;
  final int activeAmmount;
  final DateTime date;
  final PaymentPartyDetailsEntity party;
  final List<PaymentOrderDetailsEntity> orders;

  const ReceiptDetailsEntity({
    this.id,
    this.receiptId,
    required this.ammount,
    required this.payments,
    required this.business,
    required this.paymentMode,
    required this.activeAmmount,
    required this.date,
    required this.party,
    required this.orders,
  }) : super();

  @override
  List<Object?> get props => [
        id,
        receiptId,
        ammount,
        payments,
        business,
        paymentMode,
        activeAmmount,
        date,
        party,
        orders,
      ];

  factory ReceiptDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$ReceiptDetailsEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ReceiptDetailsEntityToJson(this);
}
