part of 'item_image_bloc.dart';

enum ItemImageStatus {
  LOADING,
  SUCCESS_WITH_IMAGES,
  SUCCESS_WITH_NO_IMAGES,
  FAILURE
}

class ItemImageState extends Equatable {
  final ItemImageStatus status;
  final List<Uint8List> imageList;

  const ItemImageState({
    this.status = ItemImageStatus.LOADING,
    this.imageList = const <Uint8List>[],
  });

  ItemImageState copyWith({
    ItemImageStatus? status,
    List<Uint8List>? imageList,
  }) {
    return ItemImageState(
      status: status ?? this.status,
      imageList: imageList ?? this.imageList,
    );
  }

  @override
  List<Object> get props => [status, imageList];
}
