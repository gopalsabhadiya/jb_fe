import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'order_party.dart';

part 'order_details.g.dart';

String? ignoreIfEmpty(String? value) {
  return value == null || value.isEmpty ? null : value;
}

@JsonSerializable(explicitToJson: true)
class OrderDetailsEntity extends Equatable {
  @JsonKey(
    name: "_id",
    required: false,
    includeIfNull: false,
    toJson: ignoreIfEmpty,
  )
  final String id;
  final String orderId;
  final double totalAmmount;
  final double billOutstanding;
  final DateTime date;
  final OrderPartyEntity party;

  const OrderDetailsEntity({
    required this.id,
    required this.orderId,
    required this.totalAmmount,
    required this.billOutstanding,
    required this.party,
    required this.date,
  });

  factory OrderDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsEntityFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDetailsEntityToJson(this);

  static List<OrderDetailsEntity> fromJsonToList(List<dynamic> json) {
    for (int i = 0; i < json.length; i++) {
      OrderDetailsEntity.fromJson(json[i]);
    }
    return List<OrderDetailsEntity>.from(
      json.map(
        (order) => OrderDetailsEntity.fromJson(order),
      ),
    );
  }

  @override
  List<Object?> get props => [
        id,
        orderId,
        totalAmmount,
        billOutstanding,
        party,
        date,
      ];

  @override
  String toString() {
    return 'OrderDetailsEntity{id: $id, orderId: $orderId, totalAmmount: $totalAmmount, billOutstanding: $billOutstanding, date: $date, party: $party}';
  }
}
