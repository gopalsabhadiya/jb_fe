import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pieces_enabler_state.dart';

class PiecesEnablerCubit extends Cubit<PiecesEnablerState> {
  PiecesEnablerCubit() : super(const PiecesEnablerState());
  void negate() => emit(
        PiecesEnablerState(
          value: !state.value,
        ),
      );
  void positive() => emit(
        const PiecesEnablerState(
          value: true,
        ),
      );
  void negative() => emit(
        const PiecesEnablerState(
          value: false,
        ),
      );
}
