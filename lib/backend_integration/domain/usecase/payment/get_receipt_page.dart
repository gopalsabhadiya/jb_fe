import 'package:jb_fe/backend_integration/domain/entities/receipt/details/receipt_details.dart';
import 'package:jb_fe/backend_integration/domain/repositories/receipt_repository.dart';
import 'package:jb_fe/backend_integration/dto/payment/details/receipt_details_presentation.dart';

class GetReceiptPageUseCase {
  final ReceiptRepository repository;

  GetReceiptPageUseCase({required this.repository});

  Future<List<ReceiptDetailsPresentation>> call({int skip = 0}) async {
    print("A");
    List<ReceiptDetailsEntity> receiptEntityList =
        await repository.getReceiptPage(skip);
    print("B");
    List<ReceiptDetailsPresentation> receiptPresentationList = receiptEntityList
        .map((receipt) => ReceiptDetailsPresentation(receipt))
        .toList();
    return receiptPresentationList;
  }
}
