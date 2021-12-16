import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/constants/enum/party_type_enum.dart';
import 'package:jb_fe/backend_integration/data/models/party_model.dart';
import 'package:json_annotation/json_annotation.dart';

class PartyEntity extends Equatable {
  @JsonKey(name: "_id")
  final String id;
  final int partyId;
  final String name;
  final String contactNo;
  final String? gstin;
  final double balance;
  final String? address;
  final String? email;
  final PartyTypeEnum type;
  final String? panNo;
  final String? aadharNo;
  final List<String>? order;
  final String user;
  final String business;
  final DateTime date;

  const PartyEntity({
    required this.id,
    required this.partyId,
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
