import 'package:jb_fe/backend_integration/domain/repositories/receipt_repository.dart';

class DeleteReceiptUseCase {
  final ReceiptRepository repository;

  DeleteReceiptUseCase({required this.repository});

  Future<void> call({required String receiptId}) async {
    return await repository.deleteReceipt(receiptId);
  }
}
