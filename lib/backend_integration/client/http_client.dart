import 'package:http/browser_client.dart';
import 'package:http/http.dart' as http;

import '../../util/logger.dart';

class AppHttpClient {
  static final log = getLogger<AppHttpClient>();
  static final http.Client _client = http.Client();

  static http.Client getHttpClient() {
    log.d("Returning HTTP Client");

    if (_client is BrowserClient) {
      log.d("Browser Client returned");
      (_client as BrowserClient).withCredentials = true;
    }
    return _client;
  }
}

// import 'package:http/http.dart' as http;
//
// class AppHttpClient {
//   static final http.Client _client = http.Client();
//
//   static http.Client getHttpClient() {
//     return _client;
//   }
// }
