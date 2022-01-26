import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_order_details.g.dart';

String? ignoreIfEmpty(String? value) {
  return value == null || value.isEmpty ? null : value;
}

@JsonSerializable(explicitToJson: true)
class PaymentOrderDetailsEntity extends Equatable {
  @JsonKey(
    name: "_id",
    required: false,
    includeIfNull: false,
    toJson: ignoreIfEmpty,
  )
  final String? id;
  final String orderId;
  final int finalAmmount;
  final DateTime date;

  const PaymentOrderDetailsEntity({
    this.id,
    required this.orderId,
    required this.finalAmmount,
    required this.date,
  }) : super();

  @override
  List<Object?> get props => [
        id,
        orderId,
        finalAmmount,
        date,
      ];

  factory PaymentOrderDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$PaymentOrderDetailsEntityFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentOrderDetailsEntityToJson(this);
}
