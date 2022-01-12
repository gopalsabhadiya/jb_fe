part of 'cart_form_toggle_cubit.dart';

class CartFormToggleState extends Equatable {
  final bool show;
  const CartFormToggleState({this.show = false});

  @override
  List<Object> get props => [show];
}
