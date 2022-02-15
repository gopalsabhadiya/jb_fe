part of 'business_data_bloc.dart';

enum BusinessDataStatus {
  LOADING,
  COMPLETED,
  ERROR,
}

class BusinessDataState extends Equatable {
  final BusinessDataStatus status;
  final BusinessPresentation? business;

  const BusinessDataState({
    this.status = BusinessDataStatus.COMPLETED,
    this.business,
  });

  BusinessDataState copyWith({
    BusinessDataStatus? status,
    BusinessPresentation? business,
  }) {
    return BusinessDataState(
      status: status ?? this.status,
      business: business ?? this.business,
    );
  }

  @override
  List<Object?> get props => [status, business];
}
