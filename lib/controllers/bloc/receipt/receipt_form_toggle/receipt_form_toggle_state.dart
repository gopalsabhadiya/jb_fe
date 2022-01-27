part of 'receipt_form_toggle_cubit.dart';

abstract class ToggleForReceipt extends Equatable {
  const ToggleForReceipt();
}

class ToggleForNewReceipt extends ToggleForReceipt {
  const ToggleForNewReceipt();
  @override
  List<Object?> get props => [];
}

class ToggleForReceiptDisplay extends ToggleForReceipt {
  final String receiptId;
  const ToggleForReceiptDisplay({required this.receiptId});
  @override
  List<Object?> get props => [receiptId];
}

class DoNotToggle extends ToggleForReceipt {
  const DoNotToggle();
  @override
  List<Object?> get props => [];
}

class ReceiptFormToggleState extends Equatable {
  final ToggleForReceipt toggleForReceipt;
  const ReceiptFormToggleState({
    this.toggleForReceipt = const DoNotToggle(),
  });

  @override
  List<Object?> get props => [toggleForReceipt];
}
