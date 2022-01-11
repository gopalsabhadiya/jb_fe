import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/durations/animation_durations.dart';
import 'package:jb_fe/controllers/bloc/cart/cart/cart_bloc.dart';
import 'package:jb_fe/controllers/bloc/cart/cart_form_toggle/cart_form_toggle_cubit.dart';
import 'package:jb_fe/util/screen_size.dart';

import 'cart_drawer_content.dart';

class CartFormDrawer extends StatefulWidget {
  const CartFormDrawer({Key? key}) : super(key: key);

  @override
  State<CartFormDrawer> createState() => _CartFormDrawerState();
}

class _CartFormDrawerState extends State<CartFormDrawer>
    with TickerProviderStateMixin {
  late Animation<Offset> animation;

  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: AnimationDuration.SHORT,
    );
    animation =
        Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartFormToggleCubit, CartFormToggleState>(
      builder: (context, state) {
        if (state.show) {
          _openDrawer();
          return Positioned(
            top: ScreenSizeUtil.getNavbarPreferredSize(context).height,
            child: SlideTransition(
              position: animation,
              child: Container(
                width: ScreenSizeUtil.getBottomDrawerWidth(context),
                height: ScreenSizeUtil.getBottomDrawerHeight(context),
                color: AppColors.blue_1,
                child: CartDrawerContent(
                  closeDrawer: _closeDrawer,
                  cartItems: BlocProvider.of<CartBloc>(context).state.itemList,
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }

  void _openDrawer() {
    animationController.forward();
  }

  void _closeDrawer() async {
    await animationController.reverse();
    BlocProvider.of<CartFormToggleCubit>(context).closeDrawer();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
