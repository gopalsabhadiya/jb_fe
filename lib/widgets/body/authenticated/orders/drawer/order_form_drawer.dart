import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/durations/animation_durations.dart';
import 'package:jb_fe/controllers/bloc/order/fetch_order/fetch_order_bloc.dart';
import 'package:jb_fe/controllers/bloc/order/order_form_toggle/order_form_toggle_cubit.dart';
import 'package:jb_fe/injection_container.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/orders/add_edit/add_order.dart';
import 'package:jb_fe/widgets/body/authenticated/orders/view/display_order.dart';

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
              if (state.toggleForOrder is ToggleForNewOrder) {
                _openDrawer();
                return AddOrder(
                  closeDrawer: _cancelUpdate,
                  order: OrderPresentation.empty(),
                );
              }
              if (state.toggleForOrder is ToggleForOrderDisplay) {
                _openDrawer();
                return BlocProvider<FetchOrderBloc>(
                  create: (context) => serviceLocator<FetchOrderBloc>()
                    ..add(
                      FetchOrder(
                        orderIdToBeFetched:
                            (state.toggleForOrder as ToggleForOrderDisplay)
                                .orderId,
                      ),
                    ),
                  child: ViewOrder(
                    closeDrawer: _closeDrawer,
                  ),
                );
              }
              return Container();
              // return CartDrawerContent(
              //   closeDrawer: _closeDrawer,
              // );
            },
          ),
        ),
      ),
    );
  }

  void _openDrawer() {
    animationController.forward();
  }

  _cancelUpdate() {
    _closeDrawer();
    BlocProvider.of<OrderFormToggleCubit>(context).closeDrawer();
  }

  void _closeDrawer() async {
    await animationController.reverse();
    BlocProvider.of<OrderFormToggleCubit>(context).closeDrawer();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
