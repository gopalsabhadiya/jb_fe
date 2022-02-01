import 'package:jb_fe/backend_integration/constants/enum/payment_mode_enum.dart';
import 'package:jb_fe/backend_integration/domain/entities/receipt/details/receipt_details.dart';
import 'package:jb_fe/backend_integration/dto/payment/details/receipt_party_details_presentation.dart';

class ReceiptDetailsPresentation {
  String _id;
  String _receiptId;
  late double _ammount;
  late double _activeAmmount;
  late ReceiptPartyDetailsPresentation _party;
  late PaymentModeEnum _paymentMode;
  late DateTime _date;

  ReceiptDetailsPresentation(ReceiptDetailsEntity entity)
      : _id = entity.id,
        _receiptId = entity.receiptId,
        _ammount = entity.ammount,
        _activeAmmount = entity.activeAmmount,
        _party = ReceiptPartyDetailsPresentation(entity.party),
        _paymentMode = entity.paymentMode,
        _date = entity.date,
        super();

  DateTime get date => _date;
  PaymentModeEnum get paymentMode => _paymentMode;
  ReceiptPartyDetailsPresentation get party => _party;
  double get activeAmmount => _activeAmmount;
  double get ammount => _ammount;
  String get receiptId => _receiptId;
  String get id => _id;

  @override
  String toString() {
    return 'ReceiptDetailsPresentation{_id: $_id, _receiptId: $_receiptId, _ammount: $_ammount, _activeAmmount: $_activeAmmount, _party: $_party, _paymentMode: $_paymentMode, _date: $_date}';
  }
}
