import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/durations/animation_durations.dart';
import 'package:jb_fe/controllers/bloc/cart/cart_form_toggle/cart_form_toggle_cubit.dart';
import 'package:jb_fe/controllers/bloc/order/order_form_toggle/order_form_toggle_cubit.dart';
import 'package:jb_fe/util/screen_size.dart';

class OrderFormDrawer extends StatefulWidget {
  const OrderFormDrawer({Key? key}) : super(key: key);

  @override
  State<OrderFormDrawer> createState() => _OrderFormDrawerState();
}

class _OrderFormDrawerState extends State<OrderFormDrawer>
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
    return Positioned(
      top: ScreenSizeUtil.getNavbarPreferredSize(context).height,
      child: SlideTransition(
        position: animation,
        child: Container(
          width: ScreenSizeUtil.getBottomDrawerWidth(context),
          height: ScreenSizeUtil.getBottomDrawerHeight(context),
          color: AppColors.blue_1,
          child: BlocBuilder<OrderFormToggleCubit, OrderFormToggleState>(
            builder: (BuildContext context, OrderFormToggleState state) {
              if (state.toggleForOrder is ToggleForOrderUpdate) {}
              return CartDrawerContent(
                closeDrawer: _closeDrawer,
              );
            },
          ),
        ),
      ),
    );
    // return BlocBuilder<CartFormToggleCubit, CartFormToggleState>(
    //   builder: (context, state) {
    //     if (state.show) {
    //       _openDrawer();
    //       return Positioned(
    //         top: ScreenSizeUtil.getNavbarPreferredSize(context).height,
    //         child: SlideTransition(
    //           position: animation,
    //           child: Container(
    //             width: ScreenSizeUtil.getBottomDrawerWidth(context),
    //             height: ScreenSizeUtil.getBottomDrawerHeight(context),
    //             color: AppColors.blue_1,
    //             child: CartDrawerContent(
    //               closeDrawer: _closeDrawer,
    //             ),
    //           ),
    //         ),
    //       );
    //     }
    //     return Container();
    //   },
    // );
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
