import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/util/extension/common_logging.dart';

import '../../../../util/logger.dart';

part 'unsorted_amount_state.dart';

class UnsortedAmountCubit extends Cubit<UnsortedAmountState> {
  final log = getLogger<UnsortedAmountCubit>();

  UnsortedAmountCubit()
      : super(
          const UnsortedAmountState(),
        );

  void setReceiptAmount({required double amount}) {
    log.logEventForCubit(eventName: "setReceiptAmount");

    emit(
      UnsortedAmountState(
        receiptAmount: amount,
        unsortedAmount: state.unsortedAmount + amount - state.receiptAmount,
      ),
    );
  }

  void deduct({required double amount}) {
    log.logEventForCubit(eventName: "deduct");

    emit(
      UnsortedAmountState(
        unsortedAmount: state.unsortedAmount - amount,
      ),
    );
  }
}
