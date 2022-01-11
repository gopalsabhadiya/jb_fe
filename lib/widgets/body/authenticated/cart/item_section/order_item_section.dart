import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/controllers/bloc/cart/cart/cart_bloc.dart';
import 'package:jb_fe/widgets/body/authenticated/cart/item_section/item_in_cart.dart';

import '../no_items.dart';

class OrderItemSection extends StatelessWidget {
  final VoidCallback _closeDrawer;
  const OrderItemSection({Key? key, required closeDrawer})
      : _closeDrawer = closeDrawer,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (BuildContext context, CartState state) {
        if (state.itemList.isEmpty) {
          return NoItems(closeDrawer: _closeDrawer);
        }
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            constraints: const BoxConstraints(maxWidth: 1000),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: state.itemList
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: ItemInCart(item: e),
                    ),
                  )
                  .toList(),
              // children: [
              //   ItemInCart(
              //     item: state.itemList.first,
              //   ),
              // ],
            ),
          ),
        );
      },
    );
  }
}
