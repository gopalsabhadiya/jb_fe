import 'package:jb_fe/backend_integration/domain/entities/item/labour.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/constants/texts/item_text.dart';
import 'package:uuid/uuid.dart';

class LabourPresentation {
  final String uuid = const Uuid().v4();

  double? _value;
  double? _newValue;
  String _type;
  String _newType;

  LabourPresentation(LabourEntity entity)
      : _value = entity.value,
        _newValue = entity.value,
        _type = entity.type,
        _newType = entity.type,
        super();

  LabourEntity getEntity() {
    return LabourEntity(
      value: _value,
      type: _type,
    );
  }

  LabourPresentation.empty()
      : _type = ItemText.LABOUR_TYPE_LIST.first,
        _newType = ItemText.LABOUR_TYPE_LIST.first,
        super();

  void updateValues() {
    _type = _newType;
    _value = _newValue;
  }

  double? get value => _value;

  double? get newValue => _newValue;

  String get type => _type;

  String get newType => _newType;

  void setNewType(String value) {
    _newType = value;
  }

  void setNewValue(String value) {
    _newValue = double.tryParse(value) ?? _value;
  }

  String? newValueValidator(String? value) {
    if (value == null || value.isEmpty || double.tryParse(value) != null) {
      return null;
    }
    return DefaultTexts.EMPTY;
  }

  @override
  String toString() {
    return 'LabourPresentation{uuid: $uuid, _value: $_value, _newValue: $_newValue, _type: $_type, _newType: $_newType}';
  }
}
