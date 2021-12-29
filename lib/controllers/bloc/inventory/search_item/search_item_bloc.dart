import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_item_event.dart';
part 'search_item_state.dart';

class SearchItemBloc extends Bloc<SearchItemEvent, SearchItemState> {
  SearchItemBloc() : super(SearchItemInitial()) {
    on<SearchItemEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
