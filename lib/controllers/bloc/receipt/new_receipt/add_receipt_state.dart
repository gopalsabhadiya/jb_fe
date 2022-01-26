part of 'add_receipt_bloc.dart';

enum AddReceiptStatus { LOADING, COMPLETED, ERROR }

class AddReceiptState extends Equatable {
  final AddReceiptStatus status;

  const AddReceiptState({this.status = AddReceiptStatus.COMPLETED});

  @override
  List<Object> get props => [status];
}
