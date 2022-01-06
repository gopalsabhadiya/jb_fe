import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:jb_fe/backend_integration/domain/entities/item/item.dart';

abstract class ItemRepository {
  Future<List<ItemEntity>> getItemPage(int pageNumber);
  Future<ItemEntity> getItem(String itemId);
  Future<ItemEntity> addItem(ItemEntity item);
  Future<ItemEntity> updateItem(ItemEntity item);
  Future<void> deleteItem(String itemId);
  Future<List<ItemEntity>> searchItem(String searchTerm, int pageNumber);
  Future<bool> uploadImages(List<PlatformFile> images, String itemId);
  Future<List<Uint8List>> downloadImages(String itemId);
}
