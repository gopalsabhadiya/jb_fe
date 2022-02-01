import 'package:jb_fe/backend_integration/data/datasource/remote/receipt_remote_ds.dart';
import 'package:jb_fe/backend_integration/domain/entities/receipt/details/receipt_details.dart';
import 'package:jb_fe/backend_integration/domain/entities/receipt/receipt.dart';
import 'package:jb_fe/backend_integration/domain/repositories/receipt_repository.dart';

class ReceiptRepositoryImpl implements ReceiptRepository {
  final ReceiptRemoteDataSource remoteDataSource;

  ReceiptRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ReceiptEntity> addReceipt(ReceiptEntity receipt) async {
    return await remoteDataSource.addReceipt(receipt);
  }

  @override
  Future<void> deleteReceipt(String receiptId) {
    // TODO: implement deleteReceipt
    throw UnimplementedError();
  }

  @override
  Future<List<ReceiptDetailsEntity>> getReceiptPage(int skip) async {
    print("!");
    return await remoteDataSource.getReceiptPage(skip);
  }

  @override
  Future<List<ReceiptDetailsEntity>> searchReceipt(
      String searchTerm, int skip) {
    // TODO: implement searchReceipt
    throw UnimplementedError();
  }

  @override
  Future<ReceiptEntity> fetchReceipt(String receiptId) async {
    return await remoteDataSource.fetchReceipt(receiptId);
  }
}
