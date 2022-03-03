part of 'payment_stats_bloc.dart';

abstract class PaymentStatsState extends Equatable {
  const PaymentStatsState();
}

class PaymentStatsInitial extends PaymentStatsState {
  @override
  List<Object> get props => [];
}
