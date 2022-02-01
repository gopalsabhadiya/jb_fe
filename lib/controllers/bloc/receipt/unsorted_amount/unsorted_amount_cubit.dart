import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'unsorted_amount_state.dart';

class UnsortedAmountCubit extends Cubit<UnsortedAmountState> {
  UnsortedAmountCubit()
      : super(
          const UnsortedAmountState(),
        );

  void setReceiptAmount({required double amount}) {
    print("Event called: $amount");
    emit(
      UnsortedAmountState(
        receiptAmount: amount,
        unsortedAmount: state.unsortedAmount + amount - state.receiptAmount,
      ),
    );
  }

  void deduct({required double amount}) => emit(
        UnsortedAmountState(
          unsortedAmount: state.unsortedAmount - amount,
        ),
      );
}
