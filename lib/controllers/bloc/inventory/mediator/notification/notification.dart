import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';

enum ItemNotificationType {
  ITEM_DELETED,
  ITEM_UPDATED,
  ITEM_CREATED,
  ITEM_ADD_REQUEST,
  ITEM_UPDATE_FROM_CART_REQUEST,
  ITEM_SEARCH_COMPLETE,
  ITEM_SEARCH_CLEARED,
  ITEM_GET_NEXT_PAGE
}

class ItemOperationNotification extends Equatable {
  final ItemNotificationType notificationType;
  const ItemOperationNotification({required this.notificationType});

  @override
  List<Object?> get props => [notificationType];
}

class DeleteItemNotification extends ItemOperationNotification {
  final String itemId;

  const DeleteItemNotification({
    required this.itemId,
  }) : super(notificationType: ItemNotificationType.ITEM_DELETED);

  @override
  List<Object> get props => [itemId, notificationType];
}

class NewItemNotification extends ItemOperationNotification {
  final ItemPresentation item;

  const NewItemNotification({
    required this.item,
  }) : super(notificationType: ItemNotificationType.ITEM_CREATED);

  @override
  List<Object> get props => [item, notificationType];
}

class UpdateItemNotification extends ItemOperationNotification {
  final ItemPresentation item;

  const UpdateItemNotification({
    required this.item,
  }) : super(notificationType: ItemNotificationType.ITEM_UPDATED);

  @override
  List<Object> get props => [item, notificationType];
}

class SearchItemCompleteNotification extends ItemOperationNotification {
  final List<ItemPresentation> result;
  final String searchTerm;
  const SearchItemCompleteNotification(
      {required this.result, required this.searchTerm})
      : super(notificationType: ItemNotificationType.ITEM_SEARCH_COMPLETE);

  @override
  List<Object> get props => [result, notificationType];
}

class SearchItemTermClearedNotification extends ItemOperationNotification {
  final List<ItemPresentation> cartItems;
  const SearchItemTermClearedNotification({required this.cartItems})
      : super(notificationType: ItemNotificationType.ITEM_SEARCH_CLEARED);

  @override
  List<Object?> get props => [cartItems];
}

class SearchNextItemPageRequestNotification extends ItemOperationNotification {
  const SearchNextItemPageRequestNotification()
      : super(notificationType: ItemNotificationType.ITEM_GET_NEXT_PAGE);
}

class AddItemRequestNotification extends ItemOperationNotification {
  const AddItemRequestNotification()
      : super(notificationType: ItemNotificationType.ITEM_ADD_REQUEST);
}

class UpdateItemFromCartNotification extends ItemOperationNotification {
  final ItemPresentation item;
  const UpdateItemFromCartNotification({required this.item})
      : super(
            notificationType:
                ItemNotificationType.ITEM_UPDATE_FROM_CART_REQUEST);
  @override
  List<Object?> get props => [item];
}

// class RemoveItemFromCartNotification extends ItemOperationNotification {
//   final ItemPresentation item;
//   const RemoveItemFromCartNotification({required this.item})
//       : super(
//             notificationType:
//                 ItemNotificationType.ITEM_REMOVED_FROM_CART_REQUEST);
//
//   @override
//   List<Object?> get props => [item];
// }
