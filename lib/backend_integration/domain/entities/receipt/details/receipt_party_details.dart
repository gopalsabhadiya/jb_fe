import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'receipt_party_details.g.dart';

String? ignoreIfEmpty(String? value) {
  return value == null || value.isEmpty ? null : value;
}

@JsonSerializable(explicitToJson: true)
class ReceiptPartyDetailsEntity extends Equatable {
  @JsonKey(
    name: "_id",
    required: false,
    includeIfNull: false,
    toJson: ignoreIfEmpty,
  )
  final String? id;
  final String partyId;
  final String name;
  final String contactNo;

  const ReceiptPartyDetailsEntity({
    this.id,
    required this.partyId,
    required this.name,
    required this.contactNo,
  }) : super();

  @override
  List<Object?> get props => [
        id,
        partyId,
        name,
        contactNo,
      ];

  factory ReceiptPartyDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$ReceiptPartyDetailsEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ReceiptPartyDetailsEntityToJson(this);
}
