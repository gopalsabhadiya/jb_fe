import 'package:jb_fe/backend_integration/domain/entities/receipt/receipt.dart';

abstract class ReceiptRepository {
  Future<ReceiptEntity> addPayment(ReceiptEntity payment);
  Future<void> deleteReceipt(String receiptId);

  Future<List<ReceiptEntity>> getReceiptPage(int pageNumber);
}
