import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'binary_state.dart';

class BinaryCubit extends Cubit<BinaryState> {
  BinaryCubit() : super(const BinaryState());
  void negate() => emit(
        BinaryState(
          value: !state.value,
        ),
      );
  void positive() => emit(
        const BinaryState(
          value: true,
        ),
      );
  void negative() => emit(
        const BinaryState(
          value: false,
        ),
      );
}
