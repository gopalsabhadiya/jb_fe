import 'package:jb_fe/backend_integration/domain/entities/order/scrap.dart';

class ScrapPresentation {
  String? _id;
  late double _netWeight;
  late double _touch;
  late double _rate;
  late double _netAmmount;

  ScrapPresentation(ScrapEntity entity)
      : _id = entity.id,
        _netWeight = entity.netWeight,
        _touch = entity.touch,
        _rate = entity.rate,
        _netAmmount = entity.netAmmount,
        super();

  ScrapPresentation.empty()
      : _netWeight = 0,
        _touch = 0,
        _rate = 0,
        _netAmmount = 0,
        super();

  String? get id => _id;
  double get netWeight => _netWeight;
  double get touch => _touch;
  double get rate => _rate;
  double get netAmmount => _netAmmount;

  void setNetWeight(double value) {
    _netWeight = value;
  }

  void setTouch(double value) {
    _touch = value;
  }

  void setRate(double value) {
    _rate = value;
  }

  ScrapEntity getEntity() {
    return ScrapEntity(
      id: _id,
      netWeight: _netWeight,
      touch: _touch,
      rate: _rate,
      netAmmount: _netAmmount,
    );
  }
}
