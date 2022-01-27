import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'receipt_form_toggle_state.dart';

class ReceiptFormToggleCubit extends Cubit<ReceiptFormToggleState> {
  ReceiptFormToggleCubit()
      : super(
          const ReceiptFormToggleState(),
        );

  void openDrawer({required ToggleForReceipt toggleForReceipt}) => emit(
        ReceiptFormToggleState(
          toggleForReceipt: toggleForReceipt,
        ),
      );
  void closeDrawer() {
    emit(
      const ReceiptFormToggleState(
        toggleForReceipt: DoNotToggle(),
      ),
    );
  }
}
