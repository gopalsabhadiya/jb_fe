import 'package:http/browser_client.dart';
import 'package:http/http.dart' as http;

class AppHttpClient {
  static final http.Client _client = http.Client();

  static http.Client getHttpClient() {
    if (_client is BrowserClient) {
      (_client as BrowserClient).withCredentials = true;
    }
    return _client;
  }
}
