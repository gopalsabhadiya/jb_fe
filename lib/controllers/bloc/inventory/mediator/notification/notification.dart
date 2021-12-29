
import 'package:equatable/equatable.dart';

enum ItemNotificationType {
  ITEM_DELETED,
  ITEM_UPDATED,
  ITEM_CREATED,
  ITEM_ADD_REQUEST,
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