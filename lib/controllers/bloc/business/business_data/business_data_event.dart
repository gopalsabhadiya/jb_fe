part of 'business_data_bloc.dart';

abstract class BusinessDataEvent extends Equatable {
  const BusinessDataEvent();
}

class FetchBusinessData extends BusinessDataEvent {
  @override
  List<Object?> get props => [];
}
