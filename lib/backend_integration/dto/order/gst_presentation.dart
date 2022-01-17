import 'package:jb_fe/backend_integration/constants/enum/gst_type_enum.dart';
import 'package:jb_fe/backend_integration/domain/entities/order/gst.dart';

class GSTPresentation {
  String? _id;
  late double _value;
  late GSTTypeEnum _type;
  late double _ammount;

  GSTPresentation(GSTEntity entity)
      : _id = entity.id,
        _value = entity.value,
        _type = entity.type,
        _ammount = entity.ammount,
        super();

  GSTPresentation.empty({required GSTTypeEnum type, required double value})
      : _value = value,
        _type = type,
        _ammount = 0,
        super();

  String? get id => _id;

  double get value => _value;

  GSTTypeEnum get type => _type;

  double get ammount => _ammount;

  void setType(GSTTypeEnum value) {
    _type = value;
  }

  void setValue(double value) {
    _value = value;
  }

  GSTEntity getEntity() {
    return GSTEntity(
      id: _id,
      type: _type,
      value: _value,
      ammount: _ammount,
    );
  }

  @override
  String toString() {
    return 'GSTPresentation{_id: $_id, _value: $_value, _type: $_type, _ammount: $_ammount}';
  }
}
