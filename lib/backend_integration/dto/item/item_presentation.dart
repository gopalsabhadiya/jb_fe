import 'package:jb_fe/backend_integration/domain/entities/item/item.dart';
import 'package:jb_fe/backend_integration/dto/item/item_extra_presentation.dart';
import 'package:jb_fe/backend_integration/dto/item/labour_presentation.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:uuid/uuid.dart';

class ItemPresentation {
  final String uuid = const Uuid().v4();
  String? _id;
  String? _itemId;
  late String _category;
  late String _newCategory;
  late String _type;
  late String _newType;
  late String _name;
  late double _grossWeight;
  late double _newGrossWeight;
  late double _netWeight;
  late double _newNetWeight;
  double? _carat;
  double? _newCarat;
  LabourPresentation? _labour;
  LabourPresentation? _newLabour;
  double? _itemAmount;
  double? _newItemAmount;
  double? _netAmount;
  double? _newNetAmount;
  late int _stockPieces;
  late int _newStockPieces;
  List<ItemExtraPresentation>? _extras;
  List<ItemExtraPresentation>? _newExtras;
  String? _huid;
  String? _newHuid;

  ItemPresentation(ItemEntity entity)
      : _id = entity.id,
        _itemId = entity.itemId,
        _category = entity.category,
        _newCategory = entity.category,
        _type = entity.type,
        _newType = entity.type,
        _name = entity.name,
        _grossWeight = entity.grossWeight,
        _newGrossWeight = entity.grossWeight,
        _netWeight = entity.netWeight,
        _newNetWeight = entity.netWeight,
        _carat = entity.carat,
        _newCarat = entity.carat,
        _labour = entity.labour != null
            ? LabourPresentation(entity.labour!)
            : LabourPresentation.empty(),
        _newLabour = entity.labour != null
            ? LabourPresentation(entity.labour!)
            : LabourPresentation.empty(),
        _itemAmount = entity.itemAmount,
        _newItemAmount = entity.itemAmount,
        _netAmount = entity.netAmount,
        _newNetAmount = entity.netAmount,
        _stockPieces = entity.stockPieces,
        _newStockPieces = entity.stockPieces,
        _extras = entity.extras != null && entity.extras!.isNotEmpty
            ? entity.extras!
                .map((extra) => ItemExtraPresentation(extra))
                .toList()
            : <ItemExtraPresentation>[ItemExtraPresentation.empty()],
        _newExtras = entity.extras != null && entity.extras!.isNotEmpty
            ? entity.extras!
                .map((extra) => ItemExtraPresentation(extra))
                .toList()
            : <ItemExtraPresentation>[ItemExtraPresentation.empty()],
        _huid = entity.huid,
        _newHuid = entity.huid,
        super();

  ItemPresentation.empty() : super();

  String? get id => _id;

  String? get itemId => _itemId;

  String get category => _category;

  String get newCategory => _newCategory;

  String get type => _type;

  String get newType => _newType;

  String get name => _name;

  double get grossWeight => _grossWeight;

  double get newGrossWeight => _newGrossWeight;

  double get netWeight => _netWeight;

  double get newNetWeight => _newNetWeight;

  double? get carat => _carat;

  double? get newCarat => _newCarat;

  LabourPresentation? get labour => _labour;

  LabourPresentation? get newLabour => _newLabour;

  double? get itemAmount => _itemAmount;

  double? get newItemAmount => _newItemAmount;

  double? get netAmount => _netAmount;

  double? get newNetAmount => _newNetAmount;

  int get stockPieces => _stockPieces;

  int get newStockPieces => _newStockPieces;

  List<ItemExtraPresentation>? get newExtras => _newExtras;

  String? get newHuid => _newHuid;

  List<ItemExtraPresentation>? get extras => _extras;

  String? get huid => _huid;

  void setNewCategory(String value) {
    _newCategory = value;
  }

  String? newCategoryValidator(String? value) {
    if (value != null) {
      return null;
    }
    return DefaultTexts.EMPTY;
  }

  void setNewType(String value) {
    _newType = value;
  }

  String? newTypeValidator(String? value) {
    if (value != null) {
      return null;
    }
    return DefaultTexts.EMPTY;
  }

  void setNewGrossWeight(String value) {
    _newGrossWeight = double.tryParse(value) ?? _newGrossWeight;
  }

  String? newGrossWeightValidator(String? value) {
    if (_newGrossWeight >= 0 &&
        value != null &&
        double.tryParse(value) != null) {
      return null;
    }
    return DefaultTexts.EMPTY;
  }

  void setNewNetWeight(String value) {
    _newNetWeight = double.tryParse(value) ?? _newNetWeight;
  }

  String? newNetWeightValidator(String? value) {
    if (_newNetWeight >= 0 && value != null && double.tryParse(value) != null) {
      return null;
    }
    return DefaultTexts.EMPTY;
  }

  void setNewCarat(String value) {
    _newCarat = double.tryParse(value) ?? _newCarat;
  }

  String? newCaratValidator(String? value) {
    if (value == null || value.isEmpty || double.tryParse(value) != null) {
      return null;
    }
    return DefaultTexts.EMPTY;
  }

  void setNewLabour(LabourPresentation value) {
    _newLabour = value;
  }

  void setNewItemAmount(double value) {
    _newItemAmount = value;
  }

  void setNewNetAmount(double value) {
    _newNetAmount = value;
  }

  void setNewStockPieces(String value) {
    _newStockPieces = int.tryParse(value) ?? _newStockPieces;
  }

  String? newStockPiecesValidator(String? value) {
    if (_newStockPieces >= 0 && value != null && int.tryParse(value) != null) {
      return null;
    }
    return DefaultTexts.EMPTY;
  }

  void setNewExtras(List<ItemExtraPresentation> value) {
    _newExtras = value;
  }

  void addNewExtra() {
    _newExtras!.add(ItemExtraPresentation.empty());
  }

  void removeNewExtra(String uuid) {
    _newExtras!.removeWhere((extra) => extra.uuid == uuid);
  }

  void setNewHuid(String value) {
    _newHuid = value;
  }

  void updateValues() {
    _category = _newCategory;
    _type = _newType;
    _name = _category + DefaultTexts.SPACE + _type;
    _grossWeight = _newGrossWeight;
    _netWeight = _newNetWeight;
    _carat = _newCarat;
    _labour = _newLabour;
    _itemAmount = _newItemAmount;
    _netAmount = _newNetAmount;
    _stockPieces = _newStockPieces;
    for (var extra in _newExtras!) {
      extra.updateValues();
    }
    _extras = _newExtras;
    _huid = _newHuid;
  }

  ItemEntity getEntity() {
    return ItemEntity(
      id: id,
      itemId: _itemId,
      category: _category,
      type: _type,
      name: _name,
      grossWeight: _grossWeight,
      netWeight: _netWeight,
      carat: _carat,
      labour: _labour != null ? _labour!.getEntity() : null,
      itemAmount: _itemAmount,
      netAmount: _netAmount,
      stockPieces: _stockPieces,
      extras: _extras != null
          ? _extras!.map((extra) => extra.getEntity()).toList()
          : null,
      huid: _huid,
    );
  }

  @override
  String toString() {
    return 'ItemPresentation{uuid: $uuid, _id: $_id, _itemId: $_itemId, _category: $_category, _newCategory: $_newCategory, _type: $_type, _newType: $_newType, _name: $_name, _grossWeight: $_grossWeight, _newGrossWeight: $_newGrossWeight, _netWeight: $_netWeight, _newNetWeight: $_newNetWeight, _carat: $_carat, _newCarat: $_newCarat, _labour: $_labour, _newLabour: $_newLabour, _itemAmount: $_itemAmount, _newItemAmount: $_newItemAmount, _netAmount: $_netAmount, _newNetAmount: $_newNetAmount, _stockPieces: $_stockPieces, _newStockPieces: $_newStockPieces, _extras: $_extras, _newExtras: $_newExtras, _huid: $_huid, _newHuid: $_newHuid}';
  }
}
