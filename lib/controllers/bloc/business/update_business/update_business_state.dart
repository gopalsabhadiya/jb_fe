part of 'update_business_bloc.dart';

enum UpdateBusinessStatus { LOADING, COMPLETED, ERROR }

class UpdateBusinessState extends Equatable {
  final UpdateBusinessStatus status;
  final BusinessPresentation? businessToBeUpdated;

  const UpdateBusinessState({
    this.status = UpdateBusinessStatus.COMPLETED,
    this.businessToBeUpdated,
  });

  UpdateBusinessState copyWith({
    UpdateBusinessStatus? status,
    BusinessPresentation? businessToBeUpdated,
  }) {
    return UpdateBusinessState(
      status: status ?? this.status,
      businessToBeUpdated: businessToBeUpdated ?? this.businessToBeUpdated,
    );
  }

  @override
  List<Object?> get props => [status, businessToBeUpdated];
}
