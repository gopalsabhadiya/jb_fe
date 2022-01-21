part of 'order_form_toggle_cubit.dart';

abstract class ToggleForOrder extends Equatable {
  const ToggleForOrder();
}

class ToggleForOrderUpdate extends ToggleForOrder {
  final OrderPresentation orderToBeUpdated;

  const ToggleForOrderUpdate({required this.orderToBeUpdated});

  @override
  List<Object?> get props => [orderToBeUpdated];
}

class ToggleForNewOrder extends ToggleForOrder {
  const ToggleForNewOrder();
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
