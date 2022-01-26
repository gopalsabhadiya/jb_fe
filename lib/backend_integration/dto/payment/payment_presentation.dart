import 'package:jb_fe/backend_integration/domain/entities/receipt/payment.dart';

class PaymentPresentation {
  String? _id;
  late String _orderId;
  late int _ammount;
  late bool _invalidated;

  PaymentPresentation(PaymentEntity entity)
      : _id = entity.id,
        _orderId = entity.orderId,
        _ammount = entity.ammount,
        _invalidated = entity.invalidated,
        super();

  PaymentEntity getEntity() {
    return PaymentEntity(
      id: _id,
      orderId: _orderId,
      ammount: _ammount,
      invalidated: _invalidated,
    );
  }

  bool get invalidated => _invalidated;
  int get ammount => _ammount;
  String get orderId => _orderId;
  String? get id => _id;
}
