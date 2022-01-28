import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/entities/item/item.dart';
import 'package:jb_fe/backend_integration/domain/entities/order/scrap.dart';
import 'package:json_annotation/json_annotation.dart';

import 'gst.dart';

part 'order.g.dart';

String? ignoreIfEmpty(String? value) {
  return value == null || value.isEmpty ? null : value;
}

@JsonSerializable(explicitToJson: true)
class OrderEntity extends Equatable {
  @JsonKey(
    name: "_id",
    required: false,
    includeIfNull: false,
    toJson: ignoreIfEmpty,
  )
  final String? id;
  final String? orderId;
  final List<ItemEntity> items;
  final List<GSTEntity> gst;
  final ScrapEntity? scrap;
  final List<String> receipts;
  final double netAmmount;
  final double totalAmmount;
  final double? scrapAmmount;
  final double finalAmmount;
  final double? kasar;
  final double billOutstanding;
  final String party;
  final bool fulfilled;
  final DateTime date;
  final double? goldRate;

  const OrderEntity({
    this.id,
    this.orderId,
    required this.items,
    required this.gst,
    this.scrap,
    required this.receipts,
    required this.netAmmount,
    required this.totalAmmount,
    this.scrapAmmount,
    required this.finalAmmount,
    this.kasar,
    required this.billOutstanding,
    required this.party,
    required this.fulfilled,
    required this.date,
    this.goldRate,
  });

  factory OrderEntity.fromJson(Map<String, dynamic> json) =>
      _$OrderEntityFromJson(json);
  Map<String, dynamic> toJson() => _$OrderEntityToJson(this);

  static List<OrderEntity> fromJsonToList(List<dynamic> json) {
    for (int i = 0; i < json.length; i++) {
      OrderEntity.fromJson(json[i]);
    }
    return List<OrderEntity>.from(
      json.map(
        (order) => OrderEntity.fromJson(order),
      ),
    );
  }

  @override
  List<Object?> get props => [
        id,
        orderId,
        items,
        gst,
        scrap,
        receipts,
        netAmmount,
        totalAmmount,
        scrapAmmount,
        finalAmmount,
        kasar,
        billOutstanding,
        party,
        fulfilled,
        date,
        goldRate,
      ];

  @override
  String toString() {
    return 'OrderEntity{id: $id, orderId: $orderId, items: $items, gst: $gst, scrap: $scrap, receipts: $receipts, netAmmount: $netAmmount, totalAmmount: $totalAmmount, scrapAmmount: $scrapAmmount, finalAmmount: $finalAmmount, kasar: $kasar, billOutstanding: $billOutstanding, party: $party, fulfilled: $fulfilled, date: $date, goldRate: $goldRate}';
  }
}
