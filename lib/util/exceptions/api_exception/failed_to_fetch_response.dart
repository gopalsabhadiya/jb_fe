import 'package:jb_fe/util/exceptions/app_exception.dart';

import '../../logger.dart';

class FailedToFetchRemoteDSResponse implements AppException {
  final int _responseCode;
  final String _uri;

  const FailedToFetchRemoteDSResponse(
      {required int responseCode, required String uri})
      : _responseCode = responseCode,
        _uri = uri,
        super();

  @override
  void logException() {
    final log = getLogger<FailedToFetchRemoteDSResponse>();
    log.e(
        "Error while fetching response from: $_uri \n Response Code: $_responseCode");
  }
}
