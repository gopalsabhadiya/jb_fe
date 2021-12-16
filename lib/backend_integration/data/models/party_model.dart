import 'package:jb_fe/backend_integration/constants/enum/party_type_enum.dart';
import 'package:jb_fe/backend_integration/domain/entities/party.dart';
import 'package:json_annotation/json_annotation.dart';

part 'party_model.g.dart';

@JsonSerializable()
class PartyModel extends PartyEntity {
  const PartyModel({
    required String id,
    required int partyId,
    required String name,
    required String contactNo,
    String? gstin,
    required double balance,
    String? address,
    String? email,
    required PartyTypeEnum type,
    String? panNo,
    String? aadharNo,
    List<String>? order,
    required String user,
    required String business,
    required DateTime date,
  }) : super(
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
          date: date,
        );

  factory PartyModel.fromJson(Map<String, dynamic> json) =>
      _$PartyModelFromJson(json);
  Map<String, dynamic> toJson() => _$PartyModelToJson(this);

  static List<PartyModel> fromJsonToList(List<dynamic> json) {
    for (int i = 0; i < json.length; i++) {
      PartyModel.fromJson(json[i]);
    }
    return List<PartyModel>.from(
        json.map((party) => PartyModel.fromJson(party)));
  }
}
