import 'package:jb_fe/backend_integration/domain/entities/item/item.dart';
import 'package:jb_fe/backend_integration/domain/repositories/item_repository.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';

class GetItemPageUseCase {
  final ItemRepository repository;

  GetItemPageUseCase({required this.repository});

  Future<List<ItemPresentation>> call({int skip = 0}) async {
    List<ItemEntity> itemEntityList = await repository.getItemPage(skip);
    print("items: $itemEntityList");
    List<ItemPresentation> itemPresentationList =
        itemEntityList.map((item) => ItemPresentation(item)).toList();
    return itemPresentationList;
  }
}
