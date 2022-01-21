part of 'add_order_bloc.dart';

enum AddOrderStatus { LOADING, COMPLETED, ERROR }

class AddOrderState extends Equatable {
  final AddOrderStatus status;

  const AddOrderState({this.status = AddOrderStatus.COMPLETED});

  @override
  List<Object> get props => [status];
}
