import 'package:jb_fe/backend_integration/constants/enum/party_type_enum.dart';
import 'package:jb_fe/backend_integration/constants/other/regex.dart';
import 'package:jb_fe/backend_integration/domain/entities/party.dart';
import 'package:jb_fe/constants/texts/defaults.dart';

class PartyPresentation {
  late String _id;
  late int _partyId;
  late String _name;
  late String _newName;
  late String _contactNo;
  late String _newContactNo;
  late String? _gstin;
  late String? _newGstin;
  late double _balance;
  late double _newBalance;
  late String? _address;
  late String? _newAddress;
  late String? _email;
  late String? _newEmail;
  late PartyTypeEnum _type;
  late PartyTypeEnum _newType;
  late String? _panNo;
  late String? _newPanNo;
  late String? _aadharNo;
  late String? _newAadharNo;
  late List<String>? _order;
  late String _user;
  late String _business;
  late DateTime _date;

  PartyPresentation(PartyEntity entity)
      : _id = entity.id,
        _partyId = entity.partyId,
        _name = entity.name,
        _newName = entity.name,
        _contactNo = entity.contactNo,
        _newContactNo = entity.contactNo,
        _gstin = entity.gstin,
        _newGstin = entity.gstin,
        _balance = entity.balance,
        _newBalance = entity.balance,
        _address = entity.address,
        _newAddress = entity.address,
        _email = entity.email,
        _newEmail = entity.email,
        _type = entity.type,
        _newType = entity.type,
        _panNo = entity.panNo,
        _newPanNo = entity.panNo,
        _aadharNo = entity.aadharNo,
        _newAadharNo = entity.aadharNo,
        _order = List.from(entity.order!),
        _user = entity.user,
        _business = entity.business,
        _date = entity.date,
        super();

  String get id => _id;

  int get partyId => _partyId;

  String get name => _name;

  String get newName => _newName;

  String get contactNo => _contactNo;

  String get newContactNo => _newContactNo;

  String? get gstin => _gstin;

  String? get newGstin => _newGstin;

  double get balance => _balance;

  double get newBalance => _newBalance;

  String? get address => _address;

  String? get newAddress => _newAddress;

  String? get email => _email;

  String? get newEmail => _newEmail;

  PartyTypeEnum get type => _type;

  PartyTypeEnum get newType => _newType;

  String? get panNo => _panNo;

  String? get newPanNo => _newPanNo;

  String? get aadharNo => _aadharNo;

  String? get newAadharNo => _newAadharNo;

  List<String>? get order => _order;

  String get user => _user;

  String get business => _business;

  DateTime get date => _date;

  set name(String value) {
    _name = value;
  }

  void setNewName(String value) {
    _newName = value;
  }

  String? nameValidator(String? name) {
    return (_newName == null || _newName.length == 0)
        ? DefaultTexts.EMPTY
        : null;
  }

  void setContactNo(String value) {
    _contactNo = value;
  }

  void setNewContactNo(String value) {
    _newContactNo = value;
  }

  String? contactNoValidator(String? contactNo) {
    return _newContactNo != null &&
            _newContactNo.length == 10 &&
            int.parse(_newContactNo) != 0
        ? null
        : DefaultTexts.EMPTY;
  }

  void setGstin(String value) {
    _gstin = value;
  }

  void setNewGstin(String value) {
    _newGstin = value;
  }

  String? gstinValidator(String? value) {
    return null;
  }

  void setBalance(double value) {
    _balance = value;
  }

  void setNewBalance(String value) {
    _newBalance = double.parse(value);
  }

  String? balanceValidator(String? value) {
    return double.parse(value!) != null ? null : DefaultTexts.EMPTY;
  }

  void setAddress(String value) {
    _address = value;
  }

  void setNewAddress(String value) {
    _newAddress = value;
  }

  bool addressValidator() {
    return _address != null;
  }

  void setEmail(String value) {
    _email = value;
  }

  void setNewEmail(String value) {
    _newEmail = value;
  }

  String? emailValidator(String? email) {
    _email != null && RegexConstants.EMAIL_REGEX.hasMatch(_email!)
        ? DefaultTexts.EMPTY
        : null;
  }

  void setType(PartyTypeEnum value) {
    _type = value;
  }

  void setNewType(PartyTypeEnum value) {
    _newType = value;
  }

  void setPanNo(String? value) {
    _panNo = value;
  }

  void setNewPanNo(String? value) {
    _newPanNo = value;
  }

  String? panNoValidator(String? panNo) {
    _panNo != null && RegexConstants.PAN_NO_REGEX.hasMatch(_aadharNo!)
        ? DefaultTexts.EMPTY
        : null;
  }

  void setAadharNo(String? value) {
    _aadharNo = value;
  }

  void setNewAadharNo(String? value) {
    _newAadharNo = value;
  }

  String? aadharNoValidator(String? aadharNo) {
    _aadharNo != null &&
            _aadharNo!.length == 12 &&
            int.parse(_aadharNo!) != null
        ? DefaultTexts.EMPTY
        : null;
  }

  void updateValues() {
    _name = _newName;
    _contactNo = _newContactNo;
    _gstin = _newGstin;
    _balance = _newBalance;
    _address = _newAddress;
    _email = _newEmail;
    _type = _newType;
    _panNo = _newPanNo;
    _aadharNo = _newAadharNo;
  }

  PartyEntity getEntity() {
    return PartyEntity(
      id: _id,
      partyId: _partyId,
      name: _name,
      contactNo: _contactNo,
      balance: _balance,
      type: _type,
      user: _user,
      business: _business,
      date: _date,
      gstin: _gstin,
      order: _order,
      aadharNo: _aadharNo,
      panNo: _panNo,
      address: _address,
      email: _email,
    );
  }

  @override
  String toString() {
    return 'PartyPresentation{_id: $_id, _partyId: $_partyId, _name: $_name, _newName: $_newName, _contactNo: $_contactNo, _newContactNo: $_newContactNo, _gstin: $_gstin, _newGstin: $_newGstin, _balance: $_balance, _newBalance: $_newBalance, _address: $_address, _newAddress: $_newAddress, _email: $_email, _newEmail: $_newEmail, _type: $_type, _newType: $_newType, _panNo: $_panNo, _newPanNo: $_newPanNo, _aadharNo: $_aadharNo, _newAadharNo: $_newAadharNo, _order: $_order, _user: $_user, _business: $_business, _date: $_date}';
  }
}
