import 'package:file_picker/file_picker.dart';
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
  double _newNetAmount;
  late int _stockPieces;
  late int _newStockPieces;
  late int _cartQuantity;
  List<ItemExtraPresentation>? _extras;
  List<ItemExtraPresentation>? _newExtras;
  String? _huid;
  String? _newHuid;
  List<PlatformFile>? _newImages;
  bool _hasImages;
  bool _newHasImages;

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
        _newNetAmount = entity.netAmount ?? 0,
        _stockPieces = entity.stockPieces,
        _newStockPieces = entity.stockPieces,
        _extras = entity.extras != null && entity.extras!.isNotEmpty
            ? entity.extras!
                .map((extra) => ItemExtraPresentation(extra))
                .toList()
            : <ItemExtraPresentation>[],
        _newExtras = entity.extras != null && entity.extras!.isNotEmpty
            ? entity.extras!
                .map((extra) => ItemExtraPresentation(extra))
                .toList()
            : <ItemExtraPresentation>[],
        _huid = entity.huid,
        _newHuid = entity.huid,
        _hasImages = entity.hasImages,
        _newHasImages = entity.hasImages,
        _cartQuantity = 0,
        super();

  ItemPresentation.empty()
      : _newCategory = DefaultTexts.EMPTY,
        _newType = DefaultTexts.EMPTY,
        _newHuid = DefaultTexts.EMPTY,
        _newStockPieces = 1,
        _newLabour = LabourPresentation.empty(),
        _newExtras = [ItemExtraPresentation.empty()],
        _newGrossWeight = 0,
        _newNetWeight = 0,
        _newImages = <PlatformFile>[],
        _hasImages = false,
        _newHasImages = false,
        _newNetAmount = 0,
        super();

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

  double get newNetAmount => _newNetAmount;

  int get stockPieces => _stockPieces;

  int get newStockPieces => _newStockPieces;

  List<ItemExtraPresentation>? get newExtras => _newExtras;

  String? get newHuid => _newHuid;

  List<ItemExtraPresentation>? get extras => _extras;

  String? get huid => _huid;

  List<PlatformFile>? get newImages => _newImages;

  bool get hasImages => _hasImages;

  bool get newHasImages => _newHasImages;

  int get cartQuantity => _cartQuantity;

  void setCartQuantity(int value) {
    _cartQuantity = value;
  }

  void setNewHasImages(bool value) {
    _newHasImages = value;
  }

  void setHasImages(bool value) {
    _hasImages = value;
  }

  bool addNewImage(PlatformFile imageFile) {
    _newImages ??= <PlatformFile>[];
    if (_newImages!
            .where((element) => element.name == imageFile.name)
            .isEmpty &&
        _newImages!.length < 4) {
      _newImages!.add(imageFile);
      _newHasImages = true;
      return true;
    }
    return false;
  }

  void clearNewImages() {
    _newImages = <PlatformFile>[];
    _newHasImages = false;
  }

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
    if (_newLabour != null) {
      _newLabour!.updateValues();
    }
    _labour = _newLabour;
    _itemAmount = _newItemAmount;
    _netAmount = _newNetAmount;
    _stockPieces = _newStockPieces;
    print("New Extras: $_newExtras");
    _newExtras = _newExtras!
        .where((element) =>
            element.newLabourCharge != null ||
            element.newPieces != null ||
            element.newRate != null)
        .toList();
    print("New Extras after filte: $_newExtras");
    _newExtras!.forEach((e) => e.updateValues());
    _extras = _newExtras;
    print("New Extras after update: $_extras");
    // for (var extra in _newExtras!) {
    //   extra.updateValues();
    // }
    // for (var element in _newExtras!) {
    //   if (element.labourCharge != null ||
    //       element.pieces != null ||
    //       element.rate != null) {
    //     print("Adding extra item: $element");
    //     _extras!.add(element);
    //   }
    // }
    // _extras = _newExtras;
    _huid = _newHuid;
    _hasImages = _newHasImages;
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
      extras: _extras!.map((extra) => extra.getEntity()).toList(),
      huid: _huid,
      hasImages: _hasImages,
    );
  }

  @override
  String toString() {
    return 'ItemPresentation{uuid: $uuid, _id: $_id, _itemId: $_itemId, _category: $_category, _newCategory: $_newCategory, _type: $_type, _newType: $_newType, _name: $_name, _grossWeight: $_grossWeight, _newGrossWeight: $_newGrossWeight, _netWeight: $_netWeight, _newNetWeight: $_newNetWeight, _carat: $_carat, _newCarat: $_newCarat, _labour: $_labour, _newLabour: $_newLabour, _itemAmount: $_itemAmount, _newItemAmount: $_newItemAmount, _netAmount: $_netAmount, _newNetAmount: $_newNetAmount, _stockPieces: $_stockPieces, _newStockPieces: $_newStockPieces, _extras: $_extras, _newExtras: $_newExtras, _huid: $_huid, _newHuid: $_newHuid, _newImages: $_newImages, _hasImages: $_hasImages, _newHasImages: $_newHasImages}';
  }
}
