import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'payment_stats_event.dart';
part 'payment_stats_state.dart';

class PaymentStatsBloc extends Bloc<PaymentStatsEvent, PaymentStatsState> {
  PaymentStatsBloc() : super(PaymentStatsInitial()) {
    on<PaymentStatsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
