import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/order/fetch_order.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/fetch_party.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/util/extension/common_logging.dart';

import '../../../../util/logger.dart';

part 'fetch_order_event.dart';
part 'fetch_order_state.dart';

class FetchOrderBloc extends Bloc<FetchOrderEvent, FetchOrderState> {
  final log = getLogger<FetchOrderBloc>();

  final FetchOrderUseCase fetchOrderUseCase;
  final FetchPartyUseCase fetchPartyUseCase;

  FetchOrderBloc(
      {required this.fetchOrderUseCase, required this.fetchPartyUseCase})
      : super(const FetchOrderState()) {
    on<FetchOrder>(_onFetchOrder);
  }

  FutureOr<void> _onFetchOrder(
      FetchOrder event, Emitter<FetchOrderState> emit) async {
    log.logEvent<FetchOrder>();

    emit(
      state.copyWith(
        status: FetchOrderStatus.LOADING,
      ),
    );

    final order = await fetchOrderUseCase(orderId: event.orderIdToBeFetched);

    final party = await fetchPartyUseCase(partyId: order.party);

    emit(
      state.copyWith(
        status: FetchOrderStatus.COMPLETED,
        order: order,
        party: party,
      ),
    );
  }
}
