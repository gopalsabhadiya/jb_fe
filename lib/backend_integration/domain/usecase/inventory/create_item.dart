import 'package:jb_fe/backend_integration/domain/repositories/item_repository.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';

class CreateItemUseCase {
  final ItemRepository repository;

  CreateItemUseCase({required this.repository});

  Future<ItemPresentation> call({required ItemPresentation item}) async {
    item.updateValues();

    final itemEntity = await repository.addItem(item.getEntity());
    if (item.newImages != null) {
      await repository.uploadImages(item.newImages!, itemEntity.id!);
    }
    return ItemPresentation(itemEntity);
  }
}
