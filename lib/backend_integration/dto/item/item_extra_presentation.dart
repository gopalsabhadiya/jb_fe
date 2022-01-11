import 'package:jb_fe/backend_integration/domain/entities/item/item_extra.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:uuid/uuid.dart';

class ItemExtraPresentation {
  final String uuid = const Uuid().v4();
  double? _rate;
  double? _newRate;
  int? _pieces;
  int? _newPieces;
  double? _labourCharge;
  double? _newLabourCharge;
  String? _type;
  String? _newType;
  double? _amount;

  ItemExtraPresentation(ItemExtraEntity entity)
      : _rate = entity.rate,
        _newRate = entity.rate,
        _pieces = entity.pieces,
        _newPieces = entity.pieces,
        _labourCharge = entity.labourCharge,
        _newLabourCharge = entity.labourCharge,
        _type = entity.type,
        _newType = entity.type,
        _amount = entity.pieces != null &&
                entity.labourCharge != null &&
                entity.pieces != 0 &&
                entity.labourCharge != 0
            ? ((entity.rate! * entity.pieces!) +
                (entity.rate! * entity.pieces!))
            : entity.rate ?? 0,
        super();

  ItemExtraEntity getEntity() {
    return ItemExtraEntity(
      rate: _rate,
      pieces: _pieces,
      labourCharge: _labourCharge,
      type: _type,
    );
  }

  void updateValues() {
    print("Updating extra values");
    _rate = _newRate;
    _pieces = _newPieces;
    _labourCharge = _newLabourCharge;
    _type = _newType;
  }

  ItemExtraPresentation.empty() : super();

  double? get rate => _rate;

  double? get newRate => _newRate;

  int? get pieces => _pieces;

  int? get newPieces => _newPieces;

  double? get labourCharge => _labourCharge;

  double? get newLabourCharge => _newLabourCharge;

  String? get type => _type;

  String? get newType => _newType;

  double? get amount => _amount;

  void setNewType(String value) {
    _newType = value;
  }

  String? newTypeValidator(String? value) {
    if (value != null) {
      return null;
    }
    return DefaultTexts.EMPTY;
  }

  void setNewLabourCharge(String value) {
    _newLabourCharge = double.tryParse(value) ?? _newLabourCharge;
  }

  String? newLabourValidator(String? value) {
    if (value == null || value.isEmpty || double.tryParse(value) != null) {
      return null;
    }
    return DefaultTexts.EMPTY;
  }

  void setNewPieces(String value) {
    _newPieces = int.tryParse(value) ?? _newPieces;
  }

  String? newPiecesValidator(String? value) {
    if (value == null || value.isEmpty || int.tryParse(value) != null) {
      return null;
    }
    return DefaultTexts.EMPTY;
  }

  void setNewRate(String value) {
    _newRate = double.tryParse(value) ?? _newRate;
  }

  String? newRateValidator(String? value) {
    if (value == null || value.isEmpty || double.tryParse(value) != null) {
      return null;
    }
    return DefaultTexts.EMPTY;
  }

  @override
  String toString() {
    return 'ItemExtraPresentation{uuid: $uuid, _rate: $_rate, _newRate: $_newRate, _pieces: $_pieces, _newPieces: $_newPieces, _labourCharge: $_labourCharge, _newLabourCharge: $_newLabourCharge, _type: $_type, _newType: $_newType}';
  }
}
