import 'package:jb_fe/backend_integration/domain/entities/item/item.dart';
import 'package:jb_fe/backend_integration/domain/repositories/item_repository.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';

class SearchItemUseCase {
  final ItemRepository repository;

  SearchItemUseCase({required this.repository});

  Future<List<ItemPresentation>> call(
      {required String searchTerm, int pageNumber = 1}) async {
    List<ItemEntity> itemEntityList =
        await repository.searchItem(searchTerm, pageNumber);

    List<ItemPresentation> itemPresentationList =
        itemEntityList.map((item) => ItemPresentation(item)).toList();

    return itemPresentationList;
  }
}
