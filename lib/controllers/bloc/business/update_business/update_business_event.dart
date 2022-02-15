part of 'update_business_bloc.dart';

abstract class UpdateBusinessEvent extends Equatable {
  const UpdateBusinessEvent();
}

class UpdateBusiness extends UpdateBusinessEvent {
  final BusinessPresentation business;

  const UpdateBusiness({required this.business});

  @override
  List<Object?> get props => [business];
}
