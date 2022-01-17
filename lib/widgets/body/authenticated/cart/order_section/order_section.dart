import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/controllers/bloc/cart/cart/cart_bloc.dart';
import 'package:jb_fe/widgets/body/authenticated/cart/order_section/order_details.dart';
import 'package:jb_fe/widgets/body/authenticated/cart/order_section/order_item_section.dart';
import 'package:jb_fe/widgets/body/authenticated/cart/order_section/scrap_details.dart';

class OrderSectionForCart extends StatelessWidget {
  final VoidCallback _closeDrawer;
  const OrderSectionForCart({Key? key, required closeDrawer})
      : _closeDrawer = closeDrawer,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      constraints: const BoxConstraints(maxWidth: 1000),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (BuildContext context, CartState state) {
          return Column(
            children: [
              OrderDetailsInCart(
                order: state.order,
              ),
              OrderItemSection(
                closeDrawer: _closeDrawer,
              ),
              const ScrapDetails(),
            ],
          );
        },
      ),
    );
  }
}
