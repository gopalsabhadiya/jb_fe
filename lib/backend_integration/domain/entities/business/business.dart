import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'bank.dart';

part 'business.g.dart';

String? ignoreIfEmpty(String? value) {
  return value == null || value.isEmpty ? null : value;
}

@JsonSerializable(explicitToJson: true)
class BusinessEntity extends Equatable {
  @JsonKey(
    name: "_id",
    required: false,
    includeIfNull: false,
    toJson: ignoreIfEmpty,
  )
  final String? id;
  final List<String> contactNo;
  final String name;
  final String address;
  final String gstin;
  final String email;
  final BankEntity bank;
  final DateTime date;
  final Map<String, List<String>> itemCollection;
  final List<String> users;
  final List<String> extras;

  const BusinessEntity({
    required this.id,
    required this.contactNo,
    required this.name,
    required this.address,
    required this.gstin,
    required this.email,
    required this.bank,
    required this.date,
    required this.itemCollection,
    required this.users,
    required this.extras,
  }) : super();

  factory BusinessEntity.fromJson(Map<String, dynamic> json) =>
      _$BusinessEntityFromJson(json);
  Map<String, dynamic> toJson() => _$BusinessEntityToJson(this);

  @override
  List<Object?> get props => [
        id,
        contactNo,
        name,
        address,
        gstin,
        email,
        bank,
        date,
        itemCollection,
        users,
        extras,
      ];

  @override
  String toString() {
    return 'BusinessEntity{id: $id, contactNo: $contactNo, name: $name, address: $address, gstin: $gstin, email: $email, bank: $bank, date: $date, itemCollection: $itemCollection, users: $users, extras: $extras}';
  }
}
