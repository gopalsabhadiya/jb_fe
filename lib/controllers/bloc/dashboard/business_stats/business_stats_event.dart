part of 'business_stats_bloc.dart';

abstract class BusinessStatsEvent extends Equatable {
  const BusinessStatsEvent();
}

class GetBusinessStats extends BusinessStatsEvent {
  @override
  List<Object?> get props => [];
}
