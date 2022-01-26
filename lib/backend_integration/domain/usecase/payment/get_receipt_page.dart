import 'package:jb_fe/backend_integration/domain/entities/receipt/receipt.dart';
import 'package:jb_fe/backend_integration/domain/repositories/receipt_repository.dart';
import 'package:jb_fe/backend_integration/dto/payment/receipt_presentation.dart';

class GetReceiptPageUseCase {
  final ReceiptRepository repository;

  GetReceiptPageUseCase({required this.repository});

  Future<List<ReceiptPresentation>> call({int skip = 0}) async {
    List<ReceiptEntity> receiptEntityList =
        await repository.getReceiptPage(skip);
    List<ReceiptPresentation> receiptPresentationList = receiptEntityList
        .map((receipt) => ReceiptPresentation(receipt))
        .toList();
    return receiptPresentationList;
  }
}
