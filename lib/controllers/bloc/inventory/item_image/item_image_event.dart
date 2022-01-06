part of 'item_image_bloc.dart';

abstract class ItemImageEvent extends Equatable {
  const ItemImageEvent();
}

class FetchImages extends ItemImageEvent {
  final ItemPresentation item;
  const FetchImages({required this.item});

  @override
  List<Object?> get props => [item];
}
