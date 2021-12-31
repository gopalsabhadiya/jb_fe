// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessEntity _$BusinessEntityFromJson(Map<String, dynamic> json) =>
    BusinessEntity(
      id: json['_id'] as String?,
      contactNo:
          (json['contactNo'] as List<dynamic>).map((e) => e as int).toList(),
      name: json['name'] as String,
      address: json['address'] as String,
      gstin: json['gstin'] as String,
      email: json['email'] as String,
      bank: BankEntity.fromJson(json['bank'] as Map<String, dynamic>),
      date: DateTime.parse(json['date'] as String),
      itemCollection: (json['itemCollection'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      users: (json['users'] as List<dynamic>).map((e) => e as String).toList(),
      extras:
          (json['extras'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BusinessEntityToJson(BusinessEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', ignoreIfEmpty(instance.id));
  val['contactNo'] = instance.contactNo;
  val['name'] = instance.name;
  val['address'] = instance.address;
  val['gstin'] = instance.gstin;
  val['email'] = instance.email;
  val['bank'] = instance.bank.toJson();
  val['date'] = instance.date.toIso8601String();
  val['itemCollection'] = instance.itemCollection;
  val['users'] = instance.users;
  val['extras'] = instance.extras;
  return val;
}
