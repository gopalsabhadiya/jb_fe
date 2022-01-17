import 'dart:typed_data';

import 'package:jb_fe/backend_integration/domain/repositories/item_repository.dart';

class FetchItemImagesUseCase {
  final ItemRepository repository;

  FetchItemImagesUseCase({required this.repository});

  Future<Map<String, Uint8List>> call({required String itemId}) async {
    print("Fetch9ing images");
    final Map<String, Uint8List> images =
        await repository.downloadImages(itemId);
    return images;
  }
}
