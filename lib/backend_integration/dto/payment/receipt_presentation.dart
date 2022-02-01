import 'package:jb_fe/backend_integration/constants/enum/payment_mode_enum.dart';
import 'package:jb_fe/backend_integration/domain/entities/receipt/details/receipt_details.dart';
import 'package:jb_fe/backend_integration/domain/entities/receipt/details/receipt_party_details.dart';
import 'package:jb_fe/backend_integration/domain/entities/receipt/payment.dart';
import 'package:jb_fe/backend_integration/domain/entities/receipt/receipt.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/backend_integration/dto/payment/payment_presentation.dart';
import 'package:jb_fe/constants/texts/defaults.dart';

import 'details/receipt_details_presentation.dart';

class ReceiptPresentation {
  String? _id;
  String? _receiptId;
  late double _ammount;
  late List<PaymentPresentation> _payments;
  late String _party;
  String? _business;
  String? _user;
  late bool _invalidated;
  late PaymentModeEnum _paymentMode;
  String? _bank;
  int? _check;
  String? _pan;
  int? _aadhar;
  late double _activeAmmount;
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

  ReceiptDetailsPresentation getReceiptDetailsPresentation(
      {required PartyPresentation party}) {
    print("Party in placed order: $party");
    return ReceiptDetailsPresentation(
      ReceiptDetailsEntity(
        id: _id!,
        receiptId: _receiptId!,
        activeAmmount: _activeAmmount,
        ammount: _ammount,
        paymentMode: _paymentMode,
        party: ReceiptPartyDetailsEntity(
          id: party.id,
          partyId: party.partyId!,
          name: party.name,
          contactNo: party.contactNo,
        ),
        date: _date,
      ),
    );
  }

  ReceiptPresentation.empty()
      : _payments = <PaymentPresentation>[],
        _paymentMode = PaymentModeEnum.values.first,
        _ammount = 0,
        _aadhar = 0,
        _pan = DefaultTexts.EMPTY,
        _bank = DefaultTexts.EMPTY,
        _check = 0,
        _invalidated = false,
        _date = DateTime.now(),
        super();

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
  String? get business => _business;
  String? get user => _user;
  bool get invalidated => _invalidated;
  PaymentModeEnum get paymentMode => _paymentMode;
  String? get bank => _bank;
  int? get check => _check;
  String? get pan => _pan;
  int? get aadhar => _aadhar;
  double get activeAmmount => _activeAmmount;
  DateTime get date => _date;

  void setParty(String value) {
    _party = value;
  }

  setPaymentMode(String value) {
    _paymentMode = PaymentModeEnum.values
        .where((element) => element.name() == value)
        .first;
  }

  String? paymentModeValidator(String? value) {
    return null;
  }

  void setAmmount(String value) {
    _ammount = double.tryParse(value) ?? _ammount;
  }

  String? ammountValidator(String? value) {
    if (value == null || value.isEmpty || double.tryParse(value) != null) {
      return null;
    }
    return DefaultTexts.EMPTY;
  }

  void setPan(String value) {
    _pan = value;
  }

  String? panValidator(String? value) {
    return null;
  }

  void setAadhar(String value) {
    _aadhar = int.tryParse(value) ?? _aadhar;
  }

  String? aadharValidator(String? value) {
    return null;
  }

  void setCheck(String value) {
    _check = int.tryParse(value) ?? _check;
  }

  String? checkValidator(String? value) {
    if (value == null || value.isEmpty || int.tryParse(value) != null) {
      return null;
    }
    return DefaultTexts.EMPTY;
  }

  void setBank(String value) {
    _bank = value;
  }

  String? bankValidator(String? value) {
    return null;
  }

  void setPayments(List<PaymentPresentation> value) {
    _payments = value;
  }

  void addPayment({required double amount, required String orderId}) {
    PaymentPresentation newPayment = PaymentPresentation(
      PaymentEntity(
        invalidated: false,
        ammount: amount,
        orderId: orderId,
      ),
    );
    _payments.add(newPayment);
  }

  void setDate(DateTime value) {
    _date = value;
  }

  void updateActiveAmmount() {
    _activeAmmount = _ammount;
  }

  @override
  String toString() {
    return 'ReceiptPresentation{_id: $_id, _receiptId: $_receiptId, _ammount: $_ammount, _payments: $_payments, _party: $_party, _business: $_business, _user: $_user, _invalidated: $_invalidated, _paymentMode: $_paymentMode, _bank: $_bank, _check: $_check, _pan: $_pan, _aadhar: $_aadhar, _activeAmmount: $_activeAmmount, _date: $_date}';
  }
}
