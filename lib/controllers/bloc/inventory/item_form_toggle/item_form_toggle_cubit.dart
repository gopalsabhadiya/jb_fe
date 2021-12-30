import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';

part 'item_form_toggle_state.dart';

class ItemFormToggleCubit extends Cubit<ItemFormToggleState> {
  ItemFormToggleCubit()
      : super(
          const ItemFormToggleState(),
        );

  void openDrawer({required ToggleForItem toggleForItem}) => emit(
        ItemFormToggleState(
          toggleForItem: toggleForItem,
        ),
      );
  void closeDrawer() => emit(
        const ItemFormToggleState(
          toggleForItem: DoNotToggle(),
        ),
      );
}
