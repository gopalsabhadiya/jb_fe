import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/util/extension/common_logging.dart';

import '../../../../util/logger.dart';

part 'receipt_form_toggle_state.dart';

class ReceiptFormToggleCubit extends Cubit<ReceiptFormToggleState> {
  final log = getLogger<ReceiptFormToggleCubit>();

  ReceiptFormToggleCubit()
      : super(
          const ReceiptFormToggleState(),
        );

  void openDrawer({required ToggleForReceipt toggleForReceipt}) {
    log.logEventForCubit(eventName: "openDrawer");

    emit(
      ReceiptFormToggleState(
        toggleForReceipt: toggleForReceipt,
      ),
    );
  }

  void closeDrawer() {
    log.logEventForCubit(eventName: "closeDrawer");

    emit(
      const ReceiptFormToggleState(
        toggleForReceipt: DoNotToggle(),
      ),
    );
  }
}
