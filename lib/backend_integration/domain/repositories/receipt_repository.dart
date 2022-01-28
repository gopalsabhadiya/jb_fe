import 'package:jb_fe/backend_integration/domain/entities/receipt/details/receipt_details.dart';
import 'package:jb_fe/backend_integration/domain/entities/receipt/receipt.dart';

abstract class ReceiptRepository {
  Future<ReceiptEntity> addPayment(ReceiptEntity payment);
  Future<void> deleteReceipt(String receiptId);

  Future<List<ReceiptDetailsEntity>> getReceiptPage(int pageNumber);
  Future<List<ReceiptDetailsEntity>> searchReceipt(String searchTerm, int skip);

  Future<ReceiptEntity> fetchReceipt(String receiptId);
}
