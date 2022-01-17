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
  final ScrapEntity scrap;
  final List<String> receipts;
  final double netAmmount;
  final double totalAmmount;
  final double scrapAmmount;
  final double finalAmmount;
  final double kasar;
  final double billOutstanding;
  final String party;
  final bool fulfilled;

  const OrderEntity({
    this.id,
    this.orderId,
    required this.items,
    required this.gst,
    required this.scrap,
    required this.receipts,
    required this.netAmmount,
    required this.totalAmmount,
    required this.scrapAmmount,
    required this.finalAmmount,
    required this.kasar,
    required this.billOutstanding,
    required this.party,
    required this.fulfilled,
  });

  factory OrderEntity.fromJson(Map<String, dynamic> json) =>
      _$OrderEntityFromJson(json);
  Map<String, dynamic> toJson() => _$OrderEntityToJson(this);

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
      ];

  @override
  String toString() {
    return 'OrderEntity{id: $id, orderId: $orderId, items: $items, gst: $gst, scrap: $scrap, receipts: $receipts, netAmmount: $netAmmount, totalAmmount: $totalAmmount, scrapAmmount: $scrapAmmount, finalAmmount: $finalAmmount, kasar: $kasar, billOutstanding: $billOutstanding, party: $party, fulfilled: $fulfilled}';
  }
}
