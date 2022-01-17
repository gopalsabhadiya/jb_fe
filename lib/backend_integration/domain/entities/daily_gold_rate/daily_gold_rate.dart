import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/entities/business/bank.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_gold_rate.g.dart';

@JsonSerializable(explicitToJson: true)
class DailyGoldRateEntity extends Equatable {
  @JsonKey(
    name: "_id",
    required: false,
    includeIfNull: false,
    toJson: ignoreIfEmpty,
  )
  final String? id;
  final double rate;
  final DateTime date;

  const DailyGoldRateEntity({
    required this.id,
    required this.rate,
    required this.date,
  }) : super();

  factory DailyGoldRateEntity.fromJson(Map<String, dynamic> json) =>
      _$DailyGoldRateEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DailyGoldRateEntityToJson(this);

  @override
  List<Object?> get props => [
        id,
        rate,
        date,
      ];

  @override
  String toString() {
    return 'DailyGoldRateEntity{id: $id, rate: $rate, date: $date}';
  }
}
