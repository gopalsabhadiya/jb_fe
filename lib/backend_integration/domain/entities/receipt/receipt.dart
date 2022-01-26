import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/entities/receipt/payment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'receipt.g.dart';

String? ignoreIfEmpty(String? value) {
  return value == null || value.isEmpty ? null : value;
}

@JsonSerializable(explicitToJson: true)
class ReceiptEntity extends Equatable {
  @JsonKey(
    name: "_id",
    required: false,
    includeIfNull: false,
    toJson: ignoreIfEmpty,
  )
  final String? id;
  final String? receiptId;
  final double ammount;
  final List<PaymentEntity> payments;
  final String business;
  final String user;
  final bool invalidated;
  final String paymentMode;
  final String bank;
  final int check;
  final String pan;
  final int aadhar;
  final int activeAmmount;
  final DateTime date;

  const ReceiptEntity({
    this.id,
    this.receiptId,
    required this.ammount,
    required this.payments,
    required this.business,
    required this.user,
    required this.invalidated,
    required this.paymentMode,
    required this.bank,
    required this.check,
    required this.pan,
    required this.aadhar,
    required this.activeAmmount,
    required this.date,
  }) : super();

  @override
  List<Object?> get props => [
        id,
        receiptId,
        ammount,
        payments,
        business,
        user,
        invalidated,
        paymentMode,
        bank,
        check,
        pan,
        aadhar,
        activeAmmount,
        date,
      ];

  factory ReceiptEntity.fromJson(Map<String, dynamic> json) =>
      _$ReceiptEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ReceiptEntityToJson(this);
}
