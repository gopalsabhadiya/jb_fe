import 'package:jb_fe/backend_integration/domain/repositories/item_repository.dart';

class DeleteItemUseCase {
  final ItemRepository repository;

  DeleteItemUseCase({required this.repository});

  Future<void> call({required String itemId}) async {
    print("Delete item Use Case: $itemId");
    return await repository.deleteItem(itemId);
  }
}
