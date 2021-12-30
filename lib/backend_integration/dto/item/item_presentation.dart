import 'package:jb_fe/backend_integration/domain/entities/item/item_extra.dart';
import 'package:jb_fe/backend_integration/domain/entities/item/item.dart';
import 'package:jb_fe/backend_integration/domain/entities/item/labour.dart';

class ItemPresentation {
  String? _id;
  int? _itemId;
  late String _category;
  late String _type;
  late String _name;
  late double _grossWeight;
  late double _netWeight;
  double? _carat;
  Labour? _labour;
  double? _itemAmount;
  double? _netAmount;
  late int _stockPieces;
  List<ItemExtra>? _extras;
  String? _huid;

  ItemPresentation(ItemEntity entity)
      : _id = entity.id,
        _itemId = entity.itemId,
        _category = entity.category,
        _type = entity.type,
        _name = entity.name,
        _grossWeight = entity.grossWeight,
        _netWeight = entity.netWeight,
        _carat = entity.carat,
        _labour = entity.labour,
        _itemAmount = entity.itemAmount,
        _netAmount = entity.netAmount,
        _stockPieces = entity.stockPieces,
        _extras = entity.extras,
        _huid = entity.huid,
        super();

  ItemPresentation.empty() : super();

  String? get id => _id;

  int? get itemId => _itemId;

  String get category => _category;

  String get type => _type;

  String get name => _name;

  double get grossWeight => _grossWeight;

  double get netWeight => _netWeight;

  double? get carat => _carat;

  Labour? get labour => _labour;

  double? get itemAmount => _itemAmount;

  double? get netAmount => _netAmount;

  int get stockPieces => _stockPieces;

  List<ItemExtra>? get extras => _extras;

  String? get huid => _huid;

  void updateValues() {}

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
      labour: _labour,
      itemAmount: _itemAmount,
      netAmount: _netAmount,
      stockPieces: _stockPieces,
      extras: _extras,
      huid: _huid,
    );
  }
}
