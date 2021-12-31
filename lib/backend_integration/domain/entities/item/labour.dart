import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'labour.g.dart';

@JsonSerializable(explicitToJson: true)
class LabourEntity extends Equatable {
  final double? value;
  final String type;

  const LabourEntity({required this.value, required this.type});

  factory LabourEntity.fromJson(Map<String, dynamic> json) =>
      _$LabourEntityFromJson(json);
  Map<String, dynamic> toJson() => _$LabourEntityToJson(this);

  @override
  List<Object?> get props => [value, type];

  @override
  String toString() {
    return 'LabourEntity{value: $value, type: $type}';
  }
}
