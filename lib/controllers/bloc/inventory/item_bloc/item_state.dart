part of 'item_bloc.dart';

enum ItemStatus { INITIAL, LOADING, SUCCESS, FAILURE }

class ItemState extends Equatable {
  final ItemStatus status;
  final List<ItemPresentation> itemList;
  final bool hasReachedMax;
  final bool needToSearch;

  const ItemState({
    this.status = ItemStatus.INITIAL,
    this.itemList = const <ItemPresentation>[],
    this.hasReachedMax = false,
    this.needToSearch = false,
  });

  ItemState copyWith({
    ItemStatus? status,
    List<ItemPresentation>? itemList,
    bool? hasReachedMax,
    bool? needToSearch,
  }) {
    return ItemState(
        status: status ?? this.status,
        itemList: itemList ?? this.itemList,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        needToSearch: needToSearch ?? this.needToSearch);
  }

  @override
  List<Object?> get props => [status, itemList, hasReachedMax, needToSearch];
}
