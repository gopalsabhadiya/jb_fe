import 'package:jb_fe/backend_integration/client/http_client.dart';
import 'package:jb_fe/backend_integration/domain/entities/receipt/details/receipt_details.dart';
import 'package:jb_fe/backend_integration/domain/entities/receipt/receipt.dart';

abstract class ReceiptRemoteDataSource {
  Future<ReceiptEntity> addPayment(ReceiptEntity payment);
  Future<void> deleteReceipt(String receiptId);

  Future<List<ReceiptDetailsEntity>> getReceiptPage(int pageNumber);
  Future<List<ReceiptDetailsEntity>> searchReceipt(String searchTerm, int skip);
}

class ReceiptRemoteDataSourceImpl implements ReceiptRemoteDataSource {
  final _http = AppHttpClient.getHttpClient();

  @override
  Future<ReceiptEntity> addPayment(ReceiptEntity payment) {
    // TODO: implement addPayment
    throw UnimplementedError();
  }

  @override
  Future<void> deleteReceipt(String receiptId) {
    // TODO: implement deleteReceipt
    throw UnimplementedError();
  }

  @override
  Future<List<ReceiptDetailsEntity>> getReceiptPage(int pageNumber) {
    // TODO: implement getReceiptPage
    throw UnimplementedError();
  }

  @override
  Future<List<ReceiptDetailsEntity>> searchReceipt(
      String searchTerm, int skip) {
    // TODO: implement searchReceipt
    throw UnimplementedError();
  }
}
