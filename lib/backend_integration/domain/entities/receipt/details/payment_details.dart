import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_details.g.dart';

String? ignoreIfEmpty(String? value) {
  return value == null || value.isEmpty ? null : value;
}

@JsonSerializable(explicitToJson: true)
class PaymentDetailsEntity extends Equatable {
  @JsonKey(
    name: "_id",
    required: false,
    includeIfNull: false,
    toJson: ignoreIfEmpty,
  )
  final String? id;
  final String orderId;
  final int ammount;
  final bool invalidated;

  const PaymentDetailsEntity({
    this.id,
    required this.orderId,
    required this.ammount,
    required this.invalidated,
  }) : super();

  @override
  List<Object?> get props => [
        id,
        orderId,
        ammount,
        invalidated,
      ];

  factory PaymentDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$PaymentDetailsEntityFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentDetailsEntityToJson(this);
}
