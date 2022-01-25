part of 'order_form_toggle_cubit.dart';

abstract class ToggleForOrder extends Equatable {
  const ToggleForOrder();
}

class ToggleForNewOrder extends ToggleForOrder {
  const ToggleForNewOrder();
  @override
  List<Object?> get props => [];
}

class ToggleForOrderDisplay extends ToggleForOrder {
  final String orderId;
  const ToggleForOrderDisplay({required this.orderId});
  @override
  List<Object?> get props => [];
}

class DoNotToggle extends ToggleForOrder {
  const DoNotToggle();
  @override
  List<Object?> get props => [];
}

class OrderFormToggleState extends Equatable {
  final ToggleForOrder toggleForOrder;
  const OrderFormToggleState({
    this.toggleForOrder = const DoNotToggle(),
  });

  @override
  List<Object?> get props => [toggleForOrder];
}
