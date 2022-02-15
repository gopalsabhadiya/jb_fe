import 'package:jb_fe/backend_integration/domain/entities/business/business.dart';
import 'package:jb_fe/backend_integration/dto/business/bank_presentation.dart';

class BusinessPresentation {
  final String? _id;
  List<String> _contactNo;
  String _name;
  String _address;
  String _gstin;
  String _email;
  BankPresentation _bank;
  DateTime _date;
  Map<String, List<String>> _itemCollection;
  List<String> _users;
  List<String> _extras;

  BusinessPresentation(BusinessEntity entity)
      : _id = entity.id,
        _contactNo = entity.contactNo,
        _name = entity.name,
        _address = entity.address,
        _gstin = entity.gstin,
        _email = entity.email,
        _bank = BankPresentation(entity.bank),
        _date = entity.date,
        _itemCollection = entity.itemCollection,
        _users = entity.users,
        _extras = entity.extras,
        super();

  BusinessPresentation.empty(
    this._id,
    this._contactNo,
    this._name,
    this._address,
    this._gstin,
    this._email,
    this._bank,
    this._date,
    this._itemCollection,
    this._users,
    this._extras,
  ) : super();

  void updateValues() {}

  BusinessEntity getEntity() {
    return BusinessEntity(
      id: _id,
      contactNo: _contactNo,
      name: _name,
      address: _address,
      gstin: _gstin,
      email: _email,
      bank: _bank.getEntity(),
      date: _date,
      itemCollection: _itemCollection,
      users: _users,
      extras: _extras,
    );
  }

  List<String> get contactNo => _contactNo;
  String get name => _name;
  String get address => _address;
  String get gstin => _gstin;
  String get email => _email;
  BankPresentation get bank => _bank;
  DateTime get date => _date;
  Map<String, List<String>> get itemCollection => _itemCollection;
  List<String> get users => _users;
  List<String> get extras => _extras;

  void setFirstContactNo(String value) {
    _contactNo[0] = value;
  }

  void setAlternateContactNo(String value) {
    _contactNo[1] = value;
  }

  void setName(String value) {
    _name = value;
  }

  void setAddress(String value) {
    _address = value;
  }

  void setGstin(String value) {
    _gstin = value;
  }

  void setEmail(String value) {
    print("Setting email: ${value}");
    _email = value;
  }

  void setBank(BankPresentation value) {
    _bank = value;
  }

  void setItemCollection(Map<String, List<String>> value) {
    _itemCollection = value;
  }

  void setExtras(List<String> value) {
    _extras = value;
  }

  @override
  String toString() {
    return 'BusinessPresentation{_id: $_id, _contactNo: $_contactNo, _name: $_name, _address: $_address, _gstin: $_gstin, _email: $_email, _bank: $_bank, _date: $_date, _itemCollection: $_itemCollection, _users: $_users, _extras: $_extras}';
  }
}
