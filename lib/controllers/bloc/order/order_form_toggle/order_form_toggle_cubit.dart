import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';

part 'order_form_toggle_state.dart';

class OrderFormToggleCubit extends Cubit<OrderFormToggleState> {
  OrderFormToggleCubit()
      : super(
          const OrderFormToggleState(),
        );

  void openDrawer({required ToggleForOrder toggleForOrder}) => emit(
        OrderFormToggleState(
          toggleForOrder: toggleForOrder,
        ),
      );
  void closeDrawer() {
    emit(
      const OrderFormToggleState(
        toggleForOrder: DoNotToggle(),
      ),
    );
  }
}
