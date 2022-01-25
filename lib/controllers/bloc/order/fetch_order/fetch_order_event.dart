part of 'fetch_order_bloc.dart';

abstract class FetchOrderEvent extends Equatable {
  const FetchOrderEvent();
}

class FetchOrder extends FetchOrderEvent {
  final String orderIdToBeFetched;

  const FetchOrder({required this.orderIdToBeFetched});

  @override
  List<Object?> get props => [orderIdToBeFetched];
}
