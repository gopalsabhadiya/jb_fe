import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/util/extension/common_logging.dart';

import '../../../../util/logger.dart';

part 'order_form_toggle_state.dart';

class OrderFormToggleCubit extends Cubit<OrderFormToggleState> {
  final log = getLogger<OrderFormToggleCubit>();
  OrderFormToggleCubit()
      : super(
          const OrderFormToggleState(),
        );

  void openDrawer({required ToggleForOrder toggleForOrder}) {
    log.logEventForCubit(eventName: "openDrawer");
    emit(
      OrderFormToggleState(
        toggleForOrder: toggleForOrder,
      ),
    );
  }

  void closeDrawer() {
    log.logEventForCubit(eventName: "closeDrawer");
    emit(
      const OrderFormToggleState(
        toggleForOrder: DoNotToggle(),
      ),
    );
  }
}
