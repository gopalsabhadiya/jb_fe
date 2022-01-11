import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_form_toggle_state.dart';

class CartFormToggleCubit extends Cubit<CartFormToggleState> {
  CartFormToggleCubit() : super(const CartFormToggleState());
  void openDrawer() {
    print("OpenDrawerRequested: ${DateTime.now().millisecondsSinceEpoch}");
    emit(
      const CartFormToggleState(
        show: true,
      ),
    );
  }

  void closeDrawer() => emit(
        const CartFormToggleState(
          show: false,
        ),
      );
}
