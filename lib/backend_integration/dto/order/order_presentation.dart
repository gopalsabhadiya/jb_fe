import 'package:jb_fe/backend_integration/constants/enum/gst_type_enum.dart';
import 'package:jb_fe/backend_integration/domain/entities/order/order.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/backend_integration/dto/order/gst_presentation.dart';
import 'package:jb_fe/backend_integration/dto/order/scrap_presentation.dart';
import 'package:jb_fe/constants/texts/defaults.dart';

class OrderPresentation {
  String? _id;
  String? _orderId;
  late List<ItemPresentation> _items;
  late List<GSTPresentation> _gst;
  late ScrapPresentation _scrap;
  late List<String> _receipts;
  late double _goldRate;
  late double _netAmmount;
  late double _totalAmmount;
  late double _scrapAmmount;
  late double _finalAmmount;
  late double _kasar;
  late double _billOutstanding;
  late String _party;
  late bool _fulfilled;

  OrderPresentation(OrderEntity entity)
      : _id = entity.id,
        _orderId = entity.orderId,
        _items = entity.items.map((e) => ItemPresentation(e)).toList(),
        _gst = entity.gst.map((e) => GSTPresentation(e)).toList(),
        _scrap = ScrapPresentation(entity.scrap),
        _receipts = entity.receipts,
        _netAmmount = entity.netAmmount,
        _totalAmmount = entity.totalAmmount,
        _scrapAmmount = entity.scrapAmmount,
        _finalAmmount = entity.finalAmmount,
        _kasar = entity.kasar,
        _billOutstanding = entity.billOutstanding,
        _party = entity.party,
        _fulfilled = entity.fulfilled,
        super();

  OrderPresentation.empty()
      : _items = <ItemPresentation>[],
        _gst = <GSTPresentation>[
          GSTPresentation.empty(type: GSTTypeEnum.CGST, value: 1.5),
          GSTPresentation.empty(type: GSTTypeEnum.SGST, value: 1.5)
        ],
        _scrap = ScrapPresentation.empty(),
        _receipts = <String>[],
        _netAmmount = 0,
        _totalAmmount = 0,
        _scrapAmmount = 0,
        _finalAmmount = 0,
        _kasar = 0,
        _billOutstanding = 0,
        _party = DefaultTexts.EMPTY,
        _fulfilled = false,
        _goldRate = 0,
        super();

  bool get fulfilled => _fulfilled;
  String get party => _party;
  double get billOutstanding => _billOutstanding;
  double get kasar => _kasar;
  double get finalAmmount => _finalAmmount;
  double get scrapAmmount => _scrapAmmount;
  double get totalAmmount => _totalAmmount;
  double get netAmmount => _netAmmount;
  List<String> get receipts => _receipts;
  ScrapPresentation get scrap => _scrap;
  List<GSTPresentation> get gst => _gst;
  List<ItemPresentation> get items => _items;
  String? get orderId => _orderId;
  String? get id => _id;
  double get goldRate => _goldRate;

  void setFulfilled(bool value) {
    _fulfilled = value;
  }

  void setParty(String value) {
    _party = value;
  }

  void setBillOutstanding(double value) {
    _billOutstanding = value;
  }

  void setKasar(double value) {
    _kasar = value;
  }

  void setFinalAmmount(double value) {
    _finalAmmount = value;
  }

  void setScrapAmmount(double value) {
    _scrapAmmount = value;
  }

  void setTotalAmmount(double value) {
    _totalAmmount = value;
  }

  void setNetAmmount(double value) {
    _netAmmount = value;
  }

  void setReceipts(List<String> value) {
    _receipts = value;
  }

  void setScrap(ScrapPresentation value) {
    _scrap = value;
  }

  void setGst(List<GSTPresentation> value) {
    _gst = value;
  }

  void setItems(List<ItemPresentation> value) {
    _items = value;
  }

  void addItem(ItemPresentation item) {
    _items.add(item);
  }

  void removeItem(ItemPresentation item) {
    _items = _items.where((e) => e.id != item.id).toList();
  }

  void setGoldRate(double value) {
    _goldRate = value;
  }

  OrderEntity getEntity() {
    return OrderEntity(
      id: _id,
      orderId: _orderId,
      items: _items.map((e) => e.getEntity()).toList(),
      gst: _gst.map((e) => e.getEntity()).toList(),
      scrap: _scrap.getEntity(),
      receipts: _receipts,
      netAmmount: _netAmmount,
      totalAmmount: _totalAmmount,
      scrapAmmount: _scrapAmmount,
      finalAmmount: _finalAmmount,
      kasar: _kasar,
      billOutstanding: _billOutstanding,
      party: _party,
      fulfilled: _fulfilled,
    );
  }

  @override
  String toString() {
    return 'OrderPresentation{_id: $_id, _orderId: $_orderId, _items: $_items, _gst: $_gst, _scrap: $_scrap, _receipts: $_receipts, _netAmmount: $_netAmmount, _totalAmmount: $_totalAmmount, _scrapAmmount: $_scrapAmmount, _finalAmmount: $_finalAmmount, _kasar: $_kasar, _billOutstanding: $_billOutstanding, _party: $_party, _fulfilled: $_fulfilled}';
  }
}
