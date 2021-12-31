import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bank.g.dart';

String? ignoreIfEmpty(String? value) {
  return value == null || value.isEmpty ? null : value;
}

@JsonSerializable(explicitToJson: true)
class BankEntity extends Equatable {
  @JsonKey(
    name: "_id",
    required: false,
    includeIfNull: false,
    toJson: ignoreIfEmpty,
  )
  final String id;
  final String name;
  final int accountNo;
  final String ifsc;
  final String branch;

  const BankEntity({
    required this.id,
    required this.name,
    required this.accountNo,
    required this.ifsc,
    required this.branch,
  });

  factory BankEntity.fromJson(Map<String, dynamic> json) =>
      _$BankEntityFromJson(json);
  Map<String, dynamic> toJson() => _$BankEntityToJson(this);

  @override
  List<Object?> get props => [id, name, accountNo, ifsc, branch];

  @override
  String toString() {
    return 'BankEntity{id: $id, name: $name, accountNo: $accountNo, ifsc: $ifsc, branch: $branch}';
  }
}
