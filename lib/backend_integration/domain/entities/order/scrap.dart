import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'scrap.g.dart';

String? ignoreIfEmpty(String? value) {
  return value == null || value.isEmpty ? null : value;
}

@JsonSerializable(explicitToJson: true)
class ScrapEntity extends Equatable {
  @JsonKey(
    name: "_id",
    required: false,
    includeIfNull: false,
    toJson: ignoreIfEmpty,
  )
  final String? id;
  final double netWeight;
  final double touch;
  final double rate;
  final double netAmmount;

  const ScrapEntity({
    this.id,
    required this.netWeight,
    required this.touch,
    required this.rate,
    required this.netAmmount,
  });

  @override
  List<Object?> get props => [id, netWeight, touch, rate, netAmmount];

  factory ScrapEntity.fromJson(Map<String, dynamic> json) =>
      _$ScrapEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ScrapEntityToJson(this);

  @override
  String toString() {
    return 'ScrapeEntity{id: $id, netWeight: $netWeight, touch: $touch, rate: $rate, netAmmount: $netAmmount}';
  }
}
