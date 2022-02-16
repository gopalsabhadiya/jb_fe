import 'package:jb_fe/backend_integration/domain/entities/user/user.dart';

class UserPresentation {
  String? _id;
  late String _name;
  late String _email;
  late String _business;
  late bool _verified;

  UserEntity getEntity() {
    return UserEntity(
      id: _id,
      name: _name,
      email: _email,
      business: _business,
      verified: _verified,
    );
  }

  UserPresentation.empty() : super();

  UserPresentation(UserEntity entity)
      : _id = entity.id,
        _name = entity.name,
        _email = entity.email,
        _business = entity.business,
        _verified = entity.verified,
        super();

  bool get verified => _verified;
  String get business => _business;
  String get email => _email;
  String get name => _name;
  String? get id => _id;
}
