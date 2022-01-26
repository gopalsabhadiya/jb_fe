import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_party_details.g.dart';

String? ignoreIfEmpty(String? value) {
  return value == null || value.isEmpty ? null : value;
}

@JsonSerializable(explicitToJson: true)
class PaymentPartyDetailsEntity extends Equatable {
  final String name;
  final String contactNo;
  final String address;
  final String gstin;

  const PaymentPartyDetailsEntity({
    required this.name,
    required this.contactNo,
    required this.address,
    required this.gstin,
  }) : super();

  @override
  List<Object?> get props => [
        name,
        contactNo,
        address,
        gstin,
      ];

  factory PaymentPartyDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$PaymentPartyDetailsEntityFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentPartyDetailsEntityToJson(this);
}
