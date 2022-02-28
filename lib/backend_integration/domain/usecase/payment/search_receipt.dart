import 'package:jb_fe/backend_integration/domain/entities/receipt/details/receipt_details.dart';
import 'package:jb_fe/backend_integration/domain/repositories/receipt_repository.dart';
import 'package:jb_fe/backend_integration/dto/payment/details/receipt_details_presentation.dart';

class SearchReceiptUseCase {
  final ReceiptRepository repository;

  SearchReceiptUseCase({required this.repository});

  Future<List<ReceiptDetailsPresentation>> call({
    required String searchTerm,
    int skip = 0,
  }) async {
    List<ReceiptDetailsEntity> receiptEntityList =
        await repository.searchReceipt(searchTerm, skip);

    List<ReceiptDetailsPresentation> receiptPresentationList = receiptEntityList
        .map((receipt) => ReceiptDetailsPresentation(receipt))
        .toList();

    return receiptPresentationList;
  }
}
