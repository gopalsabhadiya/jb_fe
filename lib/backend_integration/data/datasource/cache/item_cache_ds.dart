import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

abstract class ItemCacheDataSource {
  Future<bool> uploadImages(List<PlatformFile> images, String itemId);
  Future<List<Uint8List>> downloadImages(String itemId);
}

class ItemCacheDataSourceImpl implements ItemCacheDataSource {
  @override
  Future<List<Uint8List>> downloadImages(String itemId) {
    // TODO: implement downloadImages
    throw UnimplementedError();
  }

  @override
  Future<bool> uploadImages(List<PlatformFile> images, String itemId) {
    // TODO: implement uploadImages
    throw UnimplementedError();
  }
}
