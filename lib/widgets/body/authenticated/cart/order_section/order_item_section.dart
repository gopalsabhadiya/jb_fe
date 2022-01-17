import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/controllers/bloc/cart/cart/cart_bloc.dart';

import '../no_items.dart';
import 'item_in_cart.dart';

class OrderItemSection extends StatelessWidget {
  final VoidCallback _closeDrawer;
  const OrderItemSection({Key? key, required closeDrawer})
      : _closeDrawer = closeDrawer,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (BuildContext context, CartState state) {
        if (state.order.items.isEmpty) {
          return NoItems(closeDrawer: _closeDrawer);
        }
        return Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: AppColors.blue5WithOpacity(0.7),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: SingleChildScrollView(
              child: Column(
                children: state.order.items
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ItemInCart(item: e),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
