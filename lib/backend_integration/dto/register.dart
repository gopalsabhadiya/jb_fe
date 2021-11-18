import 'package:jb_fe/backend_integration/dto/login.dart';

class RegisterFormDTO extends LoginFormDTO {
  late String name;

  String get getName {
    return name;
  }

  void setName(String name) {
    this.name = name;
  }

  @override
  String toString() {
    return super.toString() + ' RegisterFormDTO{_name: $name}';
  }
}
