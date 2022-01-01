import 'dart:convert';

import 'package:jb_fe/backend_integration/client/http_client.dart';
import 'package:jb_fe/backend_integration/constants/uri/endpoints.dart';
import 'package:jb_fe/backend_integration/domain/entities/item/item.dart';

abstract class ItemRemoteDataSource {
  Future<ItemEntity> getItem(String itemId);
  Future<List<ItemEntity>> getItemPage(int skip);
  Future<ItemEntity> addItem(ItemEntity item);
  Future<ItemEntity> updateItem(ItemEntity item);
  Future<void> deleteItem(String itemId);
  Future<List<ItemEntity>> searchItem(String searchTerm, int skip);
}

class ItemRemoteDataSourceImpl implements ItemRemoteDataSource {
  final _http = AppHttpClient.getHttpClient();

  @override
  Future<ItemEntity> addItem(ItemEntity item) async {
    final response = await _http.post(
      EndpointUri.getAddItemURL(),
      body: jsonEncode(item.toJson()),
      headers: {
        "content-type": "application/json",
      },
    );
    return ItemEntity.fromJson(jsonDecode(response.body));
  }

  @override
  Future<void> deleteItem(String itemId) async {
    try {
      final response = await _http.delete(
        EndpointUri.getDeleteItemURL(itemId),
        headers: {"content-type": "application/json"},
      );
    } catch (e) {
      print("Exception");
    }
  }

  @override
  Future<ItemEntity> getItem(String itemId) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<List<ItemEntity>> getItemPage(int skip) async {
    final response = await _http.get(
      EndpointUri.getItemPage(skip),
      headers: {
        "content-type": "application/json",
      },
    );
    List<ItemEntity> itemPage = ItemEntity.fromJsonToList(
      json.decode(response.body),
    );
    return itemPage;
  }

  @override
  Future<List<ItemEntity>> searchItem(String searchTerm, int skip) async {
    print("Search item API");
    final response = await _http.get(
      EndpointUri.getSearchItemURL(skip, searchTerm),
      headers: {
        "content-type": "application/json",
      },
    );
    List<ItemEntity> itemPage =
        ItemEntity.fromJsonToList(json.decode(response.body));
    // print("Your parties: $partyPage");
    return itemPage;
  }

  @override
  Future<ItemEntity> updateItem(ItemEntity item) async {
    print("Update this item: $item");
    final response = await _http.put(
      EndpointUri.getUpdateItemURL(),
      body: jsonEncode(item.toJson()),
      headers: {
        "content-type": "application/json",
      },
    );
    print("Update item response: ${response.body}");
    return ItemEntity.fromJson(jsonDecode(response.body));
  }
}
