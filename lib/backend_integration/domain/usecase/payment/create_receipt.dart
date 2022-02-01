import 'package:jb_fe/backend_integration/domain/repositories/receipt_repository.dart';
import 'package:jb_fe/backend_integration/dto/payment/receipt_presentation.dart';

class CreateReceiptUseCase {
  final ReceiptRepository repository;

  CreateReceiptUseCase({required this.repository});

  Future<ReceiptPresentation> call(
      {required ReceiptPresentation receipt}) async {
    final receiptEntity = await repository.addReceipt(receipt.getEntity());
    return ReceiptPresentation(receiptEntity);
  }
}
