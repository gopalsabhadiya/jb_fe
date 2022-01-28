import 'package:jb_fe/backend_integration/domain/repositories/receipt_repository.dart';
import 'package:jb_fe/backend_integration/dto/payment/receipt_presentation.dart';

class FetchReceiptUseCase {
  final ReceiptRepository repository;

  FetchReceiptUseCase({required this.repository});

  Future<ReceiptPresentation> call({required String receiptId}) async {
    final receiptEntity = await repository.fetchReceipt(receiptId);
    return ReceiptPresentation(receiptEntity);
  }
}
