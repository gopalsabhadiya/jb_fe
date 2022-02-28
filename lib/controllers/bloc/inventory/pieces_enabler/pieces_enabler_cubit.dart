import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/util/extension/common_logging.dart';

import '../../../../util/logger.dart';

part 'pieces_enabler_state.dart';

class PiecesEnablerCubit extends Cubit<PiecesEnablerState> {
  final log = getLogger<PiecesEnablerCubit>();

  PiecesEnablerCubit() : super(const PiecesEnablerState());
  void negate() {
    log.logEventForCubit(eventName: "negate");

    emit(
      PiecesEnablerState(
        value: !state.value,
      ),
    );
  }

  void positive() {
    log.logEventForCubit(eventName: "positive");

    emit(
      const PiecesEnablerState(
        value: true,
      ),
    );
  }

  void negative() {
    log.logEventForCubit(eventName: "negative");

    emit(
      const PiecesEnablerState(
        value: false,
      ),
    );
  }
}
