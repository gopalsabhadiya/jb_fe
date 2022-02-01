import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/constants/enum/payment_mode_enum.dart';
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
  final String party;
  final String? business;
  final String? user;
  final bool invalidated;
  final PaymentModeEnum paymentMode;
  final String? bank;
  final int? check;
  final String? pan;
  final int? aadhar;
  final double activeAmmount;
  final DateTime date;

  const ReceiptEntity({
    this.id,
    this.receiptId,
    required this.ammount,
    required this.payments,
    required this.party,
    required this.business,
    required this.user,
    required this.invalidated,
    required this.paymentMode,
    this.bank,
    this.check,
    this.pan,
    this.aadhar,
    required this.activeAmmount,
    required this.date,
  }) : super();

  @override
  List<Object?> get props => [
        id,
        receiptId,
        ammount,
        party,
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

  @override
  String toString() {
    return 'ReceiptEntity{id: $id, receiptId: $receiptId, ammount: $ammount, payments: $payments, party: $party, business: $business, user: $user, invalidated: $invalidated, paymentMode: $paymentMode, bank: $bank, check: $check, pan: $pan, aadhar: $aadhar, activeAmmount: $activeAmmount, date: $date}';
  }
}
