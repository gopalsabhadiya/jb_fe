import 'dart:convert';

import 'package:jb_fe/backend_integration/client/http_client.dart';
import 'package:jb_fe/backend_integration/constants/uri/endpoints.dart';
import 'package:jb_fe/backend_integration/domain/entities/receipt/details/receipt_details.dart';
import 'package:jb_fe/backend_integration/domain/entities/receipt/receipt.dart';

abstract class ReceiptRemoteDataSource {
  Future<ReceiptEntity> addPayment(ReceiptEntity payment);
  Future<void> deleteReceipt(String receiptId);

  Future<List<ReceiptDetailsEntity>> getReceiptPage(int pageNumber);
  Future<List<ReceiptDetailsEntity>> searchReceipt(String searchTerm, int skip);

  Future<ReceiptEntity> fetchReceipt(String receiptId);
}

class ReceiptRemoteDataSourceImpl implements ReceiptRemoteDataSource {
  final _http = AppHttpClient.getHttpClient();

  @override
  Future<ReceiptEntity> addPayment(ReceiptEntity payment) {
    // TODO: implement addPayment
    throw UnimplementedError();
  }

  @override
  Future<void> deleteReceipt(String receiptId) {
    // TODO: implement deleteReceipt
    throw UnimplementedError();
  }

  @override
  Future<List<ReceiptDetailsEntity>> getReceiptPage(int skip) async {
    print("Fetching response");
    try {
      final response = await _http.get(
        EndpointUri.getReceiptPageURL(skip),
        headers: {
          "content-type": "application/json",
        },
      );
      print("Receipt fetch: ${response.statusCode} ${response.body}");
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
      String searchTerm, int skip) {
    // TODO: implement searchReceipt
    throw UnimplementedError();
  }

  @override
  Future<ReceiptEntity> fetchReceipt(String receiptId) async {
    print("Fetching receipt: $receiptId");
    final response = await _http.get(
      EndpointUri.getReceiptByIdURL(receiptId),
      headers: {
        "content-type": "application/json",
      },
    );

    print("Response: ${response.statusCode} ${response.body}");
    ReceiptEntity receipt = ReceiptEntity.fromJson(
      json.decode(response.body),
    );
    return receipt;
  }
}
