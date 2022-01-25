import 'package:jb_fe/backend_integration/domain/entities/order/details/order_details.dart';

import 'order_party_presentation.dart';

class OrderDetailsPresentation {
  String _id;
  String _orderId;
  late double _totalAmmount;
  late double _billOutstanding;
  late OrderPartyPresentation _party;
  late DateTime _date;

  OrderDetailsPresentation(OrderDetailsEntity entity)
      : _id = entity.id,
        _orderId = entity.orderId,
        _totalAmmount = entity.totalAmmount,
        _billOutstanding = entity.billOutstanding,
        _party = OrderPartyPresentation(entity.party),
        _date = entity.date,
        super();

  DateTime get date => _date;
  OrderPartyPresentation get party => _party;
  double get billOutstanding => _billOutstanding;
  double get totalAmmount => _totalAmmount;
  String get orderId => _orderId;
  String get id => _id;

  @override
  String toString() {
    return 'OrderDetailsPresentation{_id: $_id, _orderId: $_orderId, _totalAmmount: $_totalAmmount, _billOutstanding: $_billOutstanding, _party: $_party, _date: $_date}';
  }
}
