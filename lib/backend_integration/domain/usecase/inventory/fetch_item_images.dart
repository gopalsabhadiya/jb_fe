import 'dart:typed_data';

import 'package:jb_fe/backend_integration/domain/repositories/item_repository.dart';

class FetchItemImagesUseCase {
  final ItemRepository repository;

  FetchItemImagesUseCase({required this.repository});

  Future<List<Uint8List>> call({required String itemId}) async {
    return await repository.downloadImages(itemId);

    throw UnimplementedError();
  }
}
