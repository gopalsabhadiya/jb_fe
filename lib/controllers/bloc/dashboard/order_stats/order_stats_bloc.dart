import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_stats_event.dart';
part 'order_stats_state.dart';

class OrderStatsBloc extends Bloc<OrderStatsEvent, OrderStatsState> {
  OrderStatsBloc() : super(OrderStatsInitial()) {
    on<OrderStatsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
