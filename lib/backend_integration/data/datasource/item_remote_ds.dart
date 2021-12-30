import 'dart:convert';

import 'package:jb_fe/backend_integration/client/http_client.dart';
import 'package:jb_fe/backend_integration/constants/uri/endpoints.dart';
import 'package:jb_fe/backend_integration/domain/entities/item/item.dart';

abstract class ItemRemoteDataSource {
  Future<ItemEntity> getItem(String itemId);
  Future<List<ItemEntity>> getItemPage(int pageNumber);
  Future<ItemEntity> addItem(ItemEntity item);
  Future<ItemEntity> updateItem(ItemEntity item);
  Future<void> deleteItem(String itemId);
  Future<List<ItemEntity>> searchItem(String searchTerm, int pageNumber);
}

class ItemRemoteDataSourceImpl implements ItemRemoteDataSource {
  final _http = AppHttpClient.getHttpClient();

  @override
  Future<ItemEntity> addItem(ItemEntity item) {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<void> deleteItem(String itemId) {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }

  @override
  Future<ItemEntity> getItem(String itemId) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<List<ItemEntity>> getItemPage(int pageNumber) async {
    print("Trying to fetch items");
    final response = await _http.get(
      EndpointUri.getItemPage(pageNumber),
      headers: {
        "content-type": "application/json",
      },
    );
    print("Items retrieved: ${response.body}");
    List<ItemEntity> itemPage = ItemEntity.fromJsonToList(
      json.decode(response.body),
    );
    print("Converted List: $itemPage");
    return itemPage;
  }

  @override
  Future<List<ItemEntity>> searchItem(String searchTerm, int pageNumber) {
    // TODO: implement searchItem
    throw UnimplementedError();
  }

  @override
  Future<ItemEntity> updateItem(ItemEntity item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
