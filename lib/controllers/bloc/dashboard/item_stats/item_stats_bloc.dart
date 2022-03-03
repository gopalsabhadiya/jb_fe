import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'item_stats_event.dart';
part 'item_stats_state.dart';

class ItemStatsBloc extends Bloc<ItemStatsEvent, ItemStatsState> {
  ItemStatsBloc() : super(ItemStatsInitial()) {
    on<ItemStatsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
