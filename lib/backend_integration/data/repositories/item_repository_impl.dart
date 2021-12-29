import 'package:jb_fe/backend_integration/domain/entities/item.dart';
import 'package:jb_fe/backend_integration/domain/repositories/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
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
  Future<List<ItemEntity>> getItemPage(int pageNumber) {
    // TODO: implement getItemPage
    throw UnimplementedError();
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
