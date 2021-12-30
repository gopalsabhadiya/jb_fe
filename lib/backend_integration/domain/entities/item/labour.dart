import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'labour.g.dart';

@JsonSerializable(explicitToJson: true)
class Labour extends Equatable {
  final double value;
  final String type;

  const Labour({required this.value, required this.type});

  factory Labour.fromJson(Map<String, dynamic> json) => _$LabourFromJson(json);
  Map<String, dynamic> toJson() => _$LabourToJson(this);

  @override
  List<Object?> get props => [value, type];
}
