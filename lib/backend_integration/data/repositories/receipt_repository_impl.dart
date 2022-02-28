import 'package:jb_fe/backend_integration/data/datasource/remote/receipt_remote_ds.dart';
import 'package:jb_fe/backend_integration/domain/entities/receipt/details/receipt_details.dart';
import 'package:jb_fe/backend_integration/domain/entities/receipt/receipt.dart';
import 'package:jb_fe/backend_integration/domain/repositories/receipt_repository.dart';

import '../../../util/logger.dart';

class ReceiptRepositoryImpl implements ReceiptRepository {
  final log = getLogger<ReceiptRepositoryImpl>();

  final ReceiptRemoteDataSource remoteDataSource;

  ReceiptRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ReceiptEntity> addReceipt(ReceiptEntity receipt) async {
    log.d("Adding receipt");
    return await remoteDataSource.addReceipt(receipt);
  }

  @override
  Future<void> deleteReceipt(String receiptId) async {
    log.d("Deleting Receipt");
    return await remoteDataSource.deleteReceipt(receiptId);
  }

  @override
  Future<List<ReceiptDetailsEntity>> getReceiptPage(int skip) async {
    log.d("Fetching receipt page");
    return await remoteDataSource.getReceiptPage(skip);
  }

  @override
  Future<List<ReceiptDetailsEntity>> searchReceipt(
    String searchTerm,
    int skip,
  ) async {
    log.d("Searching receipt");
    return await remoteDataSource.searchReceipt(searchTerm, skip);
  }

  @override
  Future<ReceiptEntity> fetchReceipt(String receiptId) async {
    log.d("Fetching receipt");
    return await remoteDataSource.fetchReceipt(receiptId);
  }
}
