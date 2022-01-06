import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/inventory/fetch_item_images.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';

part 'item_image_event.dart';
part 'item_image_state.dart';

class ItemImageBloc extends Bloc<ItemImageEvent, ItemImageState> {
  final FetchItemImagesUseCase fetchItemImagesUseCase;
  ItemImageBloc({required this.fetchItemImagesUseCase})
      : super(const ItemImageState()) {
    on<FetchImages>(_fetchItemImages);
  }

  FutureOr<void> _fetchItemImages(
      FetchImages event, Emitter<ItemImageState> emit) async {
    try {
      if (event.item.hasImages) {
        final Map<String, Uint8List> imageMap =
            await fetchItemImagesUseCase(itemId: event.item.id!);
        emit(
          state.copyWith(
            status: ItemImageStatus.SUCCESS_WITH_IMAGES,
            imageMap: imageMap,
          ),
        );
      } else {
        emit(
          state.copyWith(status: ItemImageStatus.SUCCESS_WITH_NO_IMAGES),
        );
      }
    } catch (e) {
      print("Error in bloc: $e");
      emit(
        state.copyWith(status: ItemImageStatus.FAILURE),
      );
    }
  }
}
