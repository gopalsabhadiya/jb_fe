import 'dart:convert';

import 'package:jb_fe/backend_integration/client/http_client.dart';
import 'package:jb_fe/backend_integration/constants/uri/endpoints.dart';
import 'package:jb_fe/backend_integration/domain/entities/receipt/details/receipt_details.dart';
import 'package:jb_fe/backend_integration/domain/entities/receipt/receipt.dart';

import '../../../../util/logger.dart';
import '../../../utils/header_utils.dart';

abstract class ReceiptRemoteDataSource {
  Future<ReceiptEntity> addReceipt(ReceiptEntity payment);
  Future<void> deleteReceipt(String receiptId);

  Future<List<ReceiptDetailsEntity>> getReceiptPage(int pageNumber);
  Future<List<ReceiptDetailsEntity>> searchReceipt(String searchTerm, int skip);

  Future<ReceiptEntity> fetchReceipt(String receiptId);
}

class ReceiptRemoteDataSourceImpl implements ReceiptRemoteDataSource {
  final log = getLogger<ReceiptRemoteDataSourceImpl>();

  final _http = AppHttpClient.getHttpClient();

  @override
  Future<ReceiptEntity> addReceipt(ReceiptEntity receipt) async {
    print("Submitting receipt: $receipt");
    final response = await _http.post(
      EndpointUri.getAddReceiptURL(),
      body: jsonEncode(receipt.toJson()),
      headers: HeaderUtils.getHeader(),
    );
    print("Response: ${response.body}");
    return ReceiptEntity.fromJson(jsonDecode(response.body));
  }

  @override
  Future<void> deleteReceipt(String receiptId) async {
    try {
      final response = await _http.delete(
        EndpointUri.getDeleteReceiptURL(receiptId),
        headers: HeaderUtils.getHeader(),
      );
    } catch (e) {
      print("Exception");
    }
  }

  @override
  Future<List<ReceiptDetailsEntity>> getReceiptPage(int skip) async {
    try {
      final response = await _http.get(
        EndpointUri.getReceiptPageURL(skip),
        headers: HeaderUtils.getHeader(),
      );
      List<ReceiptDetailsEntity> receiptPage =
          ReceiptDetailsEntity.fromJsonToList(
        json.decode(response.body),
      );
      return receiptPage;
    } catch (e) {
      print("Error found: $e");
      throw e;
    }
  }

  @override
  Future<List<ReceiptDetailsEntity>> searchReceipt(
    String searchTerm,
    int skip,
  ) async {
    final response = await _http.get(
      EndpointUri.getSearchReceiptURL(skip, searchTerm),
      headers: HeaderUtils.getHeader(),
    );
    List<ReceiptDetailsEntity> receiptPage =
        ReceiptDetailsEntity.fromJsonToList(json.decode(response.body));
    return receiptPage;
  }

  @override
  Future<ReceiptEntity> fetchReceipt(String receiptId) async {
    print("Fetching receipt: $receiptId");
    final response = await _http.get(
      EndpointUri.getReceiptByIdURL(receiptId),
      headers: HeaderUtils.getHeader(),
    );

    ReceiptEntity receipt = ReceiptEntity.fromJson(
      json.decode(response.body),
    );
    return receipt;
  }
}
