import 'package:jb_fe/backend_integration/domain/entities/receipt/details/receipt_details.dart';

class ReceiptDetailsPresentation {
  String? _id;
  String? _receiptId;
  late double _ammount;
  late double _activeAmmount;
  late String _partyName;
  late String _partyContactNo;
  late String _paymentMode;
  late DateTime _date;

  ReceiptDetailsPresentation(ReceiptDetailsEntity entity)
      : _id = entity.id,
        _receiptId = entity.receiptId,
        _ammount = entity.ammount,
        _activeAmmount = entity.activeAmmount,
        _partyName = entity.partyName,
        _partyContactNo = entity.partyContactNo,
        _paymentMode = entity.paymentMode,
        _date = entity.date,
        super();

  DateTime get date => _date;
  String get paymentMode => _paymentMode;
  String get partyContactNo => _partyContactNo;
  String get partyName => _partyName;
  double get activeAmmount => _activeAmmount;
  double get ammount => _ammount;
  String? get receiptId => _receiptId;
  String? get id => _id;

  @override
  String toString() {
    return 'ReceiptDetailsPresentation{_id: $_id, _receiptId: $_receiptId, _ammount: $_ammount, _activeAmmount: $_activeAmmount, _partyName: $_partyName, _partyContactNo: $_partyContactNo, _paymentMode: $_paymentMode, _date: $_date}';
  }
}
