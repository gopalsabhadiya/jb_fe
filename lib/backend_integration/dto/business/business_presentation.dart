import 'package:jb_fe/backend_integration/domain/entities/business/business.dart';
import 'package:jb_fe/backend_integration/dto/business/bank_presentation.dart';

class BusinessPresentation {
  final String? id;
  final List<int> contactNo;
  final String name;
  final String address;
  final String gstin;
  final String email;
  final BankPresentation bank;
  final DateTime date;
  final Map<String, List<String>> itemCollection;
  final List<String> users;
  final List<String> extras;

  BusinessPresentation(BusinessEntity entity)
      : id = entity.id,
        contactNo = entity.contactNo,
        name = entity.name,
        address = entity.address,
        gstin = entity.gstin,
        email = entity.email,
        bank = BankPresentation(entity.bank),
        date = entity.date,
        itemCollection = entity.itemCollection,
        users = entity.users,
        extras = entity.extras,
        super();

  BusinessPresentation.empty(
    this.id,
    this.contactNo,
    this.name,
    this.address,
    this.gstin,
    this.email,
    this.bank,
    this.date,
    this.itemCollection,
    this.users,
    this.extras,
  ) : super();

  void updateValues() {}

  BusinessEntity getEntity() {
    return BusinessEntity(
      id: id,
      contactNo: contactNo,
      name: name,
      address: address,
      gstin: gstin,
      email: email,
      bank: bank.getEntity(),
      date: date,
      itemCollection: itemCollection,
      users: users,
      extras: extras,
    );
  }

  @override
  String toString() {
    return 'BusinessPresentation{id: $id, contactNo: $contactNo, name: $name, address: $address, gstin: $gstin, email: $email, bank: $bank, date: $date, itemCollection: $itemCollection, users: $users, extras: $extras}';
  }
}
