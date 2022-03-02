import 'dart:convert';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:file_picker/file_picker.dart';
import 'package:jb_fe/backend_integration/data/datasource/remote/item_remote_ds.dart';
import 'package:jb_fe/backend_integration/domain/entities/item/item.dart';
import 'package:jb_fe/backend_integration/domain/repositories/item_repository.dart';
import 'package:jb_fe/backend_integration/utils/storage/shared_preference.dart';
import 'package:jb_fe/injection_container.dart';

import '../../../util/logger.dart';

class ItemRepositoryImpl implements ItemRepository {
  final log = getLogger<ItemRepositoryImpl>();

  final ItemRemoteDataSource remoteDataSource;

  ItemRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ItemEntity> addItem(ItemEntity item) async {
    log.d("Adding item");
    return await remoteDataSource.addItem(item);
  }

  @override
  Future<void> deleteItem(String itemId) async {
    log.d("Deleting Item");
    return await remoteDataSource.deleteItem(itemId);
  }

  @override
  Future<ItemEntity> getItem(String itemId) async {
    log.d("Fetching Item");
    return await remoteDataSource.getItem(itemId);
  }

  @override
  Future<List<ItemEntity>> searchItem(String searchTerm, int skip) async {
    log.d("Searching Item");
    return await remoteDataSource.searchItem(searchTerm, skip);
  }

  @override
  Future<ItemEntity> updateItem(ItemEntity item) async {
    return await remoteDataSource.updateItem(item);
  }

  @override
  Future<bool> uploadImages(List<PlatformFile> images, String itemId) async {
    Map<String, String> imageMap = {
      for (PlatformFile image in images)
        image.name: base64.encode(GZipEncoder().encode(image.bytes!.toList())!)
    };

    final bool imagesAreSaved =
        await remoteDataSource.uploadImages(imageMap, itemId);

    if (imagesAreSaved) {
      serviceLocator<AppSharedPreference>().saveImages(
        itemId: itemId,
        images: json.encode(imageMap),
      );
    }
    return imagesAreSaved;
  }

  @override
  Future<List<ItemEntity>> getItemPage(int skip) async {
    return await remoteDataSource.getItemPage(skip);
  }

  @override
  Future<Map<String, Uint8List>> downloadImages(String itemId) async {
    final String imageString =
        await serviceLocator<AppSharedPreference>().getImages(itemId: itemId);

    if (imageString.isNotEmpty) {
      Map<String, Uint8List> imageMap = <String, Uint8List>{};
      for (MapEntry imageEntry in (json.decode(imageString) as Map).entries) {
        imageMap[imageEntry.key] = Uint8List.fromList(
          GZipDecoder().decodeBytes(
            base64.decode(imageEntry.value),
          ),
        );
      }
      return imageMap;
    }

    Map<String, String> imageStringMap =
        await remoteDataSource.downloadImages(itemId);

    Map<String, Uint8List> imageMap = imageStringMap.map(
      (key, value) => MapEntry(
        key,
        Uint8List.fromList(
          GZipDecoder().decodeBytes(
            base64.decode(value),
          ),
        ),
      ),
    );

    serviceLocator<AppSharedPreference>()
        .saveImages(itemId: itemId, images: json.encode(imageStringMap));
    return imageMap;
  }
}
