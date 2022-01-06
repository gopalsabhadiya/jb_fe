import 'package:jb_fe/backend_integration/domain/repositories/item_repository.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';

class CreateItemUseCase {
  final ItemRepository repository;

  CreateItemUseCase({required this.repository});

  Future<ItemPresentation> call({required ItemPresentation item}) async {
    item.updateValues();
    print("Saving item: ${item}");

    final itemEntity = await repository.addItem(item.getEntity());
    return ItemPresentation(itemEntity);
  }
}
