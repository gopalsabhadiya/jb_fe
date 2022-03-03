part of 'business_stats_bloc.dart';

enum BusinessStatsStatus { LOADING, COMPLETED, ERROR }

class BusinessStatsState extends Equatable {
  final BusinessStatsStatus status;
  final BusinessStatsEntity? businessStatsEntity;

  const BusinessStatsState({
    this.status = BusinessStatsStatus.COMPLETED,
    this.businessStatsEntity,
  });

  BusinessStatsState copyWith({
    BusinessStatsStatus? status,
    BusinessStatsEntity? businessStatsEntity,
  }) {
    return BusinessStatsState(
      status: status ?? this.status,
      businessStatsEntity: businessStatsEntity ?? this.businessStatsEntity,
    );
  }

  @override
  List<Object?> get props => [status, businessStatsEntity];
}
