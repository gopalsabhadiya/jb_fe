import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/constants/enum/gst_type_enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gst.g.dart';

String? ignoreIfEmpty(String? value) {
  return value == null || value.isEmpty ? null : value;
}

@JsonSerializable(explicitToJson: true)
class GSTEntity extends Equatable {
  @JsonKey(
    name: "_id",
    required: false,
    includeIfNull: false,
    toJson: ignoreIfEmpty,
  )
  final String? id;
  final double value;
  final GSTTypeEnum type;
  final double ammount;

  const GSTEntity({
    this.id,
    required this.value,
    required this.type,
    required this.ammount,
  });

  @override
  List<Object?> get props => [id, value, type, ammount];

  factory GSTEntity.fromJson(Map<String, dynamic> json) =>
      _$GSTEntityFromJson(json);
  Map<String, dynamic> toJson() => _$GSTEntityToJson(this);

  @override
  String toString() {
    return 'GSTEntity{id: $id, value: $value, type: $type, ammount: $ammount}';
  }
}
