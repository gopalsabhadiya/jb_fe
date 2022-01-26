import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment.g.dart';

String? ignoreIfEmpty(String? value) {
  return value == null || value.isEmpty ? null : value;
}

@JsonSerializable(explicitToJson: true)
class PaymentEntity extends Equatable {
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

  const PaymentEntity({
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

  factory PaymentEntity.fromJson(Map<String, dynamic> json) =>
      _$PaymentEntityFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentEntityToJson(this);
}
