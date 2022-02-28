import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/util/extension/common_logging.dart';

import '../../../../util/logger.dart';

part 'item_form_toggle_state.dart';

class ItemFormToggleCubit extends Cubit<ItemFormToggleState> {
  final log = getLogger<ItemFormToggleCubit>();

  ItemFormToggleCubit()
      : super(
          const ItemFormToggleState(),
        );

  void openDrawer({required ToggleForItem toggleForItem}) {
    log.logEventForCubit(eventName: "openDrawer");
    emit(
      ItemFormToggleState(
        toggleForItem: toggleForItem,
      ),
    );
  }

  void closeDrawer() {
    log.logEventForCubit(eventName: "closeDrawer");
    emit(
      const ItemFormToggleState(
        toggleForItem: DoNotToggle(),
      ),
    );
  }
}
