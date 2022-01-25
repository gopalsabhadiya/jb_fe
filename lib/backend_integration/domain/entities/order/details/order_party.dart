import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order_party.g.dart';

String? ignoreIfEmpty(String? value) {
  return value == null || value.isEmpty ? null : value;
}

@JsonSerializable(explicitToJson: true)
class OrderPartyEntity extends Equatable {
  @JsonKey(
    name: "_id",
    required: false,
    includeIfNull: false,
    toJson: ignoreIfEmpty,
  )
  final String id;
  final String name;
  final String contactNo;

  const OrderPartyEntity({
    required this.id,
    required this.name,
    required this.contactNo,
  });

  factory OrderPartyEntity.fromJson(Map<String, dynamic> json) =>
      _$OrderPartyEntityFromJson(json);
  Map<String, dynamic> toJson() => _$OrderPartyEntityToJson(this);

  @override
  List<Object?> get props => [id, name, contactNo];
}
