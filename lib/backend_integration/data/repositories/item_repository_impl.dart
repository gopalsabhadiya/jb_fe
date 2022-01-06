import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:jb_fe/backend_integration/data/datasource/remote/item_remote_ds.dart';
import 'package:jb_fe/backend_integration/domain/entities/item/item.dart';
import 'package:jb_fe/backend_integration/domain/repositories/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  final ItemRemoteDataSource remoteDataSource;

  ItemRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ItemEntity> addItem(ItemEntity item) async {
    return await remoteDataSource.addItem(item);
  }

  @override
  Future<void> deleteItem(String itemId) async {
    return await remoteDataSource.deleteItem(itemId);
  }

  @override
  Future<ItemEntity> getItem(String itemId) async {
    return await remoteDataSource.getItem(itemId);
  }

  @override
  Future<List<ItemEntity>> searchItem(String searchTerm, int pageNumber) async {
    return await remoteDataSource.searchItem(searchTerm, pageNumber);
  }

  @override
  Future<ItemEntity> updateItem(ItemEntity item) async {
    return await remoteDataSource.updateItem(item);
  }

  @override
  Future<bool> uploadImages(List<PlatformFile> images, String itemId) async {
    return await remoteDataSource.uploadImages(images, itemId);
  }

  @override
  Future<List<ItemEntity>> getItemPage(int skip) async {
    return await remoteDataSource.getItemPage(skip);
  }

  @override
  Future<List<Uint8List>> downloadImages(String itemId) async {
    return await remoteDataSource.downloadImages(itemId);
  }
}
