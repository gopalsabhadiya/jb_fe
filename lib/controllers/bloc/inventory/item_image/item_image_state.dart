part of 'item_image_bloc.dart';

enum ItemImageStatus {
  LOADING,
  SUCCESS_WITH_IMAGES,
  SUCCESS_WITH_NO_IMAGES,
  FAILURE
}

class ItemImageState extends Equatable {
  final ItemImageStatus status;
  final Map<String, Uint8List> imageMap;

  const ItemImageState({
    this.status = ItemImageStatus.LOADING,
    this.imageMap = const <String, Uint8List>{},
  });

  ItemImageState copyWith({
    ItemImageStatus? status,
    Map<String, Uint8List>? imageMap,
  }) {
    return ItemImageState(
      status: status ?? this.status,
      imageMap: imageMap ?? this.imageMap,
    );
  }

  @override
  List<Object> get props => [status, imageMap];
}
