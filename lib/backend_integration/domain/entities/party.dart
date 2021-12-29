import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/constants/enum/party_type_enum.dart';
import 'package:jb_fe/backend_integration/data/models/party/party_model.dart';
import 'package:json_annotation/json_annotation.dart';

String? ignoreIfEmpty(String? value) {
  return value == null || value.isEmpty ? null : value;
}

class PartyEntity extends Equatable {
  @JsonKey(
    name: "_id",
    required: false,
    includeIfNull: false,
    toJson: ignoreIfEmpty,
  )
  final String? id;
  final int? partyId;
  final String name;
  final String contactNo;

  @JsonKey(
    required: false,
    includeIfNull: false,
    toJson: ignoreIfEmpty,
  )
  final String? gstin;
  final double balance;

  @JsonKey(
    required: false,
    includeIfNull: false,
    toJson: ignoreIfEmpty,
  )
  final String? address;

  @JsonKey(
    required: false,
    includeIfNull: false,
    toJson: ignoreIfEmpty,
  )
  final String? email;
  final PartyTypeEnum type;

  @JsonKey(
    required: false,
    includeIfNull: false,
    toJson: ignoreIfEmpty,
  )
  final String? panNo;

  @JsonKey(
    required: false,
    includeIfNull: false,
    toJson: ignoreIfEmpty,
  )
  final String? aadharNo;

  @JsonKey(
    required: false,
    includeIfNull: false,
  )
  final List<String>? order;

  @JsonKey(
    required: false,
    includeIfNull: false,
  )
  final String? user;

  @JsonKey(
    required: false,
    includeIfNull: false,
  )
  final String? business;

  @JsonKey(
    required: false,
    includeIfNull: false,
  )
  final DateTime? date;

  const PartyEntity({
    this.id,
    this.partyId,
    required this.name,
    required this.contactNo,
    required this.balance,
    required this.type,
    required this.user,
    required this.business,
    required this.date,
    this.gstin,
    this.address,
    this.panNo,
    this.aadharNo,
    this.order,
    this.email,
  }) : super();

  @override
  List<Object?> get props => [
        id,
        partyId,
        name,
        contactNo,
        gstin,
        balance,
        address,
        email,
        type,
        panNo,
        aadharNo,
        order,
        user,
        business,
        date
      ];

  PartyModel getModel() {
    return PartyModel(
        id: id,
        partyId: partyId,
        name: name,
        contactNo: contactNo,
        gstin: gstin,
        balance: balance,
        address: address,
        email: email,
        type: type,
        panNo: panNo,
        aadharNo: aadharNo,
        order: order,
        user: user,
        business: business,
        date: date);
  }
}
