import 'package:jb_fe/backend_integration/domain/entities/order/details/order_party.dart';

class OrderPartyPresentation {
  String _id;
  String _name;
  String _contactNo;

  OrderPartyPresentation(OrderPartyEntity entity)
      : _id = entity.id,
        _name = entity.name,
        _contactNo = entity.contactNo,
        super();

  String get id => _id;

  @override
  String toString() {
    return 'OrderPartyPresentation{_id: $_id, _name: $_name, _contactNo: $_contactNo}';
  }

  String get name => _name;

  String get contactNo => _contactNo;
}
