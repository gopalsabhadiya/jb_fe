import 'dart:convert';

import 'package:jb_fe/backend_integration/client/http_client.dart';
import 'package:jb_fe/backend_integration/constants/uri/endpoints.dart';
import 'package:jb_fe/backend_integration/domain/entities/item/item.dart';

import '../../../../util/exceptions/app_exception.dart';
import '../../../../util/logger.dart';
import '../../../utils/header_utils.dart';

abstract class ItemRemoteDataSource {
  Future<ItemEntity> getItem(String itemId);
  Future<List<ItemEntity>> getItemPage(int skip);
  Future<ItemEntity> addItem(ItemEntity item);
  Future<ItemEntity> updateItem(ItemEntity item);
  Future<void> deleteItem(String itemId);
  Future<List<ItemEntity>> searchItem(String searchTerm, int skip);
  Future<bool> uploadImages(Map<String, String> images, String itemId);
  Future<Map<String, String>> downloadImages(String itemId);
}

class ItemRemoteDataSourceImpl implements ItemRemoteDataSource {
  final log = getLogger<ItemRemoteDataSourceImpl>();

  final _http = AppHttpClient.getHttpClient();

  @override
  Future<ItemEntity> addItem(ItemEntity item) async {
    try {
      log.d("Trying to add item: $item");
      final response = await _http.post(
        EndpointUri.getAddItemURL(),
        body: jsonEncode(item.toJson()),
        headers: HeaderUtils.getHeader(),
      );
      return ItemEntity.fromJson(jsonDecode(response.body));
    } on AppException {
      rethrow;
    } catch (e) {
      log.e(
        "Error while fetching response for: ${EndpointUri.getAddItemURL()}",
      );
      log.e(e);
      rethrow;
    }
  }

  @override
  Future<void> deleteItem(String itemId) async {
    try {
      log.d("Trying to delete item: $itemId");
      final response = await _http.delete(
        EndpointUri.getDeleteItemURL(itemId),
        headers: HeaderUtils.getHeader(),
      );
    } on AppException {
      rethrow;
    } catch (e) {
      log.e(
        "Error while fetching response for: ${EndpointUri.getDeleteItemURL(itemId)}",
      );
      log.e(e);
      rethrow;
    }
  }

  @override
  Future<ItemEntity> getItem(String itemId) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<List<ItemEntity>> getItemPage(int skip) async {
    try {
      log.d("Trying to get item page: skip($skip)");
      final response = await _http.get(
        EndpointUri.getItemPage(skip),
        headers: HeaderUtils.getHeader(),
      );
      List<ItemEntity> itemPage = ItemEntity.fromJsonToList(
        json.decode(response.body),
      );
      return itemPage;
    } on AppException {
      rethrow;
    } catch (e) {
      log.e(
        "Error while fetching response for: ${EndpointUri.getItemPage(skip)}",
      );
      log.e(e);
      rethrow;
    }
  }

  @override
  Future<List<ItemEntity>> searchItem(String searchTerm, int skip) async {
    try {
      log.d("Trying to search item: SearchTerm($searchTerm) Skip($skip)");
      final response = await _http.get(
        EndpointUri.getSearchItemURL(skip, searchTerm),
        headers: HeaderUtils.getHeader(),
      );
      List<ItemEntity> itemPage =
          ItemEntity.fromJsonToList(json.decode(response.body));
      // print("Your parties: $partyPage");
      return itemPage;
    } on AppException {
      rethrow;
    } catch (e) {
      log.e(
        "Error while fetching response for: ${EndpointUri.getSearchItemURL(skip, searchTerm)}",
      );
      log.e(e);
      rethrow;
    }
  }

  @override
  Future<ItemEntity> updateItem(ItemEntity item) async {
    try {
      log.d("Trying to update item: $item");
      final response = await _http.put(
        EndpointUri.getUpdateItemURL(),
        body: jsonEncode(item.toJson()),
        headers: HeaderUtils.getHeader(),
      );
      return ItemEntity.fromJson(jsonDecode(response.body));
    } on AppException {
      rethrow;
    } catch (e) {
      log.e(
        "Error while fetching response for: ${EndpointUri.getUpdateItemURL()}",
      );
      log.e(e);
      rethrow;
    }
  }

  @override
  Future<bool> uploadImages(Map<String, String> images, String itemId) async {
    try {
      log.d("Trying to upload Images: $itemId");
      final response = await _http.get(
        EndpointUri.getUploadImageSignedItemURL(itemId),
        headers: HeaderUtils.getHeader(),
      );

      // Map<String, String> imageMap = {
      //   for (PlatformFile image in images)
      //     image.name: base64.encode(GZipEncoder().encode(image.bytes!.toList())!)
      // };

      final uploadResponse = await _http.put(
        Uri.parse(json.decode(response.body)["url"]),
        body: json.encode(images),
      );
      return uploadResponse.statusCode == 200;
    } on AppException {
      rethrow;
    } catch (e) {
      log.e(
        "Error while fetching response for: ${EndpointUri.getUploadImageSignedItemURL(itemId)}",
      );
      log.e(e);
      rethrow;
    }
  }

  // @override
  // Future<bool> uploadImages(List<PlatformFile> images, String itemId) async {
  //   final response = await _http.get(
  //     EndpointUri.getUploadImageSignedItemURL(itemId),
  //     headers: {
  //       "content-type": "application/json",
  //     },
  //   );
  //   File('the_file').readAsBytesSync();
  //   final uploadResponse = await _http.put(
  //     Uri.parse(json.decode(response.body)["url"]),
  //     body: json.encode(
  //       images.map((e) => e.bytes!.toList()).toList(),
  //     ),
  //   );
  //   return uploadResponse.statusCode == 200;
  // }

  // @override
  // Future<bool> uploadImages(List<PlatformFile> images, String itemId) async {
  //   final response = await _http.get(
  //     EndpointUri.getUploadImageSignedItemURL(itemId),
  //     headers: {
  //       "content-type": "application/json",
  //     },
  //   );
  //   var request = http.MultipartRequest(
  //     "PUT",
  //     Uri.parse(json.decode(response.body)["url"]),
  //   );
  //   for (final PlatformFile image in images) {
  //     request.files.add(
  //       http.MultipartFile.fromBytes(
  //         image.name,
  //         image.bytes!,
  //         filename: image.name,
  //         contentType: MediaType(
  //           'image',
  //           image.extension!,
  //         ),
  //       ),
  //     );
  //   }
  //   var uploadResponse = await request.send();
  //   print("Upload Response: ${uploadResponse.statusCode}");
  //   return uploadResponse.statusCode == 200;
  // }

  @override
  Future<Map<String, String>> downloadImages(String itemId) async {
    try {
      log.d("Trying to download image for item: $itemId");
      final response = await _http.get(
        EndpointUri.getDownloadImageSignedItemURL(itemId),
      );
      final downloadResponse = await _http.get(
        Uri.parse(json.decode(response.body)["url"]),
        headers: {
          "content-type": "text/plain; charset=utf-8",
        },
      );

      // print("DownloadResponse: ${downloadResponse.statusCode}");

      // print("Json type: ${downloadResponse.body}");

      // base64.encode(GZipEncoder().encode(e.bytes!.toList())!)

      Map<String, String> imageMap = <String, String>{};
      for (MapEntry imageEntry
          in (json.decode(downloadResponse.body) as Map).entries) {
        // List<int> intMappedList = image.map((e) => e as int).toList();
        // imageMap[imageEntry.key] = Uint8List.fromList(
        //     GZipDecoder().decodeBytes(base64.decode(imageEntry.value)));
        imageMap[imageEntry.key] = imageEntry.value;
      }
      return imageMap;
    } on AppException {
      rethrow;
    } catch (e) {
      log.e(
        "Error while fetching response for: ${EndpointUri.getDownloadImageSignedItemURL(itemId)}",
      );
      log.e(e);
      rethrow;
    }
  }

  // @override
  // Future<List<Uint8List>> downloadImages(String itemId) async {
  //   final response = await _http.get(
  //     EndpointUri.getDownloadImageSignedItemURL(itemId),
  //   );
  //   var request = http.MultipartRequest(
  //     "GET",
  //     Uri.parse(json.decode(response.body)["url"]),
  //   );
  //   final downloadResponse = await request.send();
  //   // final downloadResponse = await _http.get(
  //   //   Uri.parse(json.decode(response.body)["url"]),
  //   //   headers: {
  //   //     "content-type": "text/plain; charset=utf-8",
  //   //   },
  //   // );
  //
  //   // final Uint8List finalResponse = await downloadResponse.stream.toBytes();
  //   // print("Final response: $finalResponse");
  //
  //   print("DownloadResponse: ${downloadResponse.statusCode}");
  //
  //   // print("Json type: ${downloadResponse.body}");
  //   final httpResponse = await http.Response.fromStream(downloadResponse);
  //
  //   // print("HttpResponse: ${httpResponse.body}");
  //
  //   // List<Uint8List> imageList = <Uint8List>[];
  //   // for (List<dynamic> image in json.decode(httpResponse.body)) {
  //   //   List<int> intMappedList = image.map((e) => e as int).toList();
  //   //   Uint8List imageUint = Uint8List.fromList(intMappedList);
  //   //   imageList.add(Uint8List.fromList(intMappedList));
  //   // }
  //   // return finalResponse.map((e) => Uint8List.view(e)).toList();
  //   throw UnimplementedError();
  // }
}
