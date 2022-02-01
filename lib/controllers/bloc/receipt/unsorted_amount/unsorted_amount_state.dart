part of 'unsorted_amount_cubit.dart';

class UnsortedAmountState extends Equatable {
  final double unsortedAmount;
  final double receiptAmount;
  const UnsortedAmountState({
    this.unsortedAmount = 0,
    this.receiptAmount = 0,
  });

  UnsortedAmountState copyWith({
    double? unsortedAmount,
    double? receiptAmount,
  }) {
    return UnsortedAmountState(
      unsortedAmount: unsortedAmount ?? this.unsortedAmount,
      receiptAmount: receiptAmount ?? this.receiptAmount,
    );
  }

  @override
  List<Object?> get props => [unsortedAmount, receiptAmount];
}
