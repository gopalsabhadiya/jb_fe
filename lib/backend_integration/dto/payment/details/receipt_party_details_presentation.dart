import 'package:jb_fe/backend_integration/domain/entities/receipt/details/receipt_party_details.dart';

class ReceiptPartyDetailsPresentation {
  String? _id;
  late String _partyId;
  late String _name;
  late String _contactNo;

  ReceiptPartyDetailsPresentation(ReceiptPartyDetailsEntity entity)
      : _id = entity.id,
        _partyId = entity.partyId,
        _name = entity.name,
        _contactNo = entity.contactNo,
        super();

  String get contactNo => _contactNo;
  String get name => _name;
  String get partyId => _partyId;
  String? get id => _id;

  @override
  String toString() {
    return 'ReceiptPartyDetailsPresentation{_id: $_id, _partyId: $_partyId, _name: $_name, _contactNo: $_contactNo}';
  }
}
