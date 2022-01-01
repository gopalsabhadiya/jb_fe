import 'package:jb_fe/backend_integration/domain/entities/item/item.dart';
import 'package:jb_fe/backend_integration/domain/repositories/item_repository.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';

class UpdateItemUseCase {
  final ItemRepository repository;

  UpdateItemUseCase({required this.repository});

  Future<ItemPresentation> call({required ItemPresentation item}) async {
    item.updateValues();
    final ItemEntity entity = await repository.updateItem(item.getEntity());
    return ItemPresentation(entity);
  }
}
