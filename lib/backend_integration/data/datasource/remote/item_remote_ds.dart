import 'dart:convert';
import 'dart:typed_data';

//import 'package:http_parser/http_parser.dart';
import 'package:archive/archive.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
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
  Future<bool> uploadImages(List<PlatformFile> images, String itemId);
  Future<List<Uint8List>> downloadImages(String itemId);
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
    final response = await _http.put(
      EndpointUri.getUpdateItemURL(),
      body: jsonEncode(item.toJson()),
      headers: {
        "content-type": "application/json",
      },
    );
    return ItemEntity.fromJson(jsonDecode(response.body));
  }

  @override
  Future<bool> uploadImages(List<PlatformFile> images, String itemId) async {
    final response = await _http.get(
      EndpointUri.getUploadImageSignedItemURL(itemId),
      headers: {
        "content-type": "application/json",
      },
    );
    try {
      var myString = 'myString';
      print(myString);

      var stringBytes = utf8.encode(myString);
      var gzipBytes = GZipEncoder().encode(stringBytes);
      print(gzipBytes);

      var compressedString = base64.encode(gzipBytes!);
      print(compressedString);
    } catch (e) {
      print("EX: $e");
    }

    final uploadResponse = await _http.put(
      Uri.parse(json.decode(response.body)["url"]),
      body: json.encode(
        images
            .map(
              (e) => base64.encode(GZipEncoder().encode(e.bytes!.toList())!),
            )
            .toList(),
      ),
    );
    return uploadResponse.statusCode == 200;
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
  Future<List<Uint8List>> downloadImages(String itemId) async {
    final response = await _http.get(
      EndpointUri.getDownloadImageSignedItemURL(itemId),
    );
    final downloadResponse = await _http.get(
      Uri.parse(json.decode(response.body)["url"]),
      headers: {
        "content-type": "text/plain; charset=utf-8",
      },
    );


    print("DownloadResponse: ${downloadResponse.statusCode}");

    print("Json type: ${downloadResponse.body}");
    // base64.encode(GZipEncoder().encode(e.bytes!.toList())!)

    List<Uint8List> imageList = <Uint8List>[];
    for (String imageString in json.decode(downloadResponse.body)) {
      // List<int> intMappedList = image.map((e) => e as int).toList();
      Uint8List imageUint = Uint8List.fromList(GZipDecoder().decodeBytes(base64.decode(imageString)));
      imageList.add(imageUint);
    }
    return imageList;
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
