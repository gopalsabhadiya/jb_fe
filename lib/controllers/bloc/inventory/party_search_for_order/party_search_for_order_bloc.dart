import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/search_party.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/util/extension/common_logging.dart';

import '../../../../util/logger.dart';

part 'party_search_for_order_event.dart';
part 'party_search_for_order_state.dart';

class PartySearchForOrderBloc
    extends Bloc<PartySearchForOrderEvent, PartySearchForOrderState> {
  final log = getLogger<PartySearchForOrderBloc>();

  final SearchPartyUseCase searchPartyUseCase;
  PartySearchForOrderBloc({
    required this.searchPartyUseCase,
  }) : super(const PartySearchForOrderState()) {
    on<SearchPartyForOrder>(_searchPartyForOrder);
  }

  FutureOr<void> _searchPartyForOrder(
      SearchPartyForOrder event, Emitter<PartySearchForOrderState> emit) async {
    log.logEvent<SearchPartyForOrder>();

    emit(
      state.copyWith(
        status: PartySearchForOrderStatus.LOADING,
      ),
    );
    try {
      final searchResult = await searchPartyUseCase(
        searchTerm: event.searchTerm,
      );
      emit(
        state.copyWith(
          status: PartySearchForOrderStatus.COMPLETED,
          result: List.of(searchResult),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: PartySearchForOrderStatus.ERROR,
        ),
      );
      return null;
    }
  }
}
