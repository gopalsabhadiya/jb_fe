import 'package:jb_fe/util/exceptions/app_exception.dart';

import '../../logger.dart';

class InvalidLoginCreds implements AppException {
  final String _email;

  const InvalidLoginCreds({required String email})
      : _email = email,
        super();

  @override
  void logException() {
    final log = getLogger<InvalidLoginCreds>();
    log.e(
      "Invalid Login Credentials: $_email",
    );
  }
}
