import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/order/fetch_order.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/fetcch_party.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';

part 'fetch_order_event.dart';
part 'fetch_order_state.dart';

class FetchOrderBloc extends Bloc<FetchOrderEvent, FetchOrderState> {
  final FetchOrderUseCase fetchOrderUseCase;
  final FetchPartyUseCase fetchPartyUseCase;

  FetchOrderBloc(
      {required this.fetchOrderUseCase, required this.fetchPartyUseCase})
      : super(const FetchOrderState()) {
    on<FetchOrder>(_onFetchOrder);
  }

  FutureOr<void> _onFetchOrder(
      FetchOrder event, Emitter<FetchOrderState> emit) async {
    emit(
      state.copyWith(
        status: FetchOrderStatus.LOADING,
      ),
    );
    print(
        "Fetch order for order id: ${event.orderIdToBeFetched} $fetchPartyUseCase");
    final order = await fetchOrderUseCase(orderId: event.orderIdToBeFetched);
    print("OrderPesentation: $order");

    final party = await fetchPartyUseCase(partyId: order.party);

    print("PartyPesentation: $party");
    emit(
      state.copyWith(
        status: FetchOrderStatus.COMPLETED,
        order: order,
        party: party,
      ),
    );
  }
}
