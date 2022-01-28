import 'package:jb_fe/backend_integration/domain/entities/receipt/receipt.dart';
import 'package:jb_fe/backend_integration/dto/payment/payment_presentation.dart';

class ReceiptPresentation {
  String? _id;
  String? _receiptId;
  late double _ammount;
  late List<PaymentPresentation> _payments;
  late String _party;
  late String _business;
  late String _user;
  late bool _invalidated;
  late String _paymentMode;
  late String? _bank;
  late int? _check;
  late String? _pan;
  late int? _aadhar;
  late int _activeAmmount;
  late DateTime _date;

  ReceiptEntity getEntity() {
    return ReceiptEntity(
      id: _id,
      receiptId: _receiptId,
      ammount: _ammount,
      payments: _payments.map((e) => e.getEntity()).toList(),
      party: _party,
      business: _business,
      user: _user,
      invalidated: _invalidated,
      paymentMode: _paymentMode,
      bank: _bank,
      check: _check,
      pan: _pan,
      aadhar: _aadhar,
      activeAmmount: _activeAmmount,
      date: _date,
    );
  }

  ReceiptPresentation(ReceiptEntity entity)
      : _id = entity.id,
        _receiptId = entity.receiptId,
        _ammount = entity.ammount,
        _payments = entity.payments.map((e) => PaymentPresentation(e)).toList(),
        _party = entity.party,
        _business = entity.business,
        _user = entity.user,
        _invalidated = entity.invalidated,
        _paymentMode = entity.paymentMode,
        _bank = entity.bank,
        _check = entity.check,
        _pan = entity.pan,
        _aadhar = entity.aadhar,
        _activeAmmount = entity.activeAmmount,
        _date = entity.date,
        super();

  String? get id => _id;
  String? get receiptId => _receiptId;
  double get ammount => _ammount;
  List<PaymentPresentation> get payments => _payments;
  String get party => _party;
  String get business => _business;
  String get user => _user;
  bool get invalidated => _invalidated;
  String get paymentMode => _paymentMode;
  String? get bank => _bank;
  int? get check => _check;
  String? get pan => _pan;
  int? get aadhar => _aadhar;
  int get activeAmmount => _activeAmmount;
  DateTime get date => _date;
}
