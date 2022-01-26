import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/controllers/bloc/authenticated_sidepanel.dart';
import 'package:jb_fe/controllers/bloc/business/business_data_bloc.dart';
import 'package:jb_fe/controllers/bloc/dashboard/daily_gold_rate/daily_gold_rate_bloc.dart';
import 'package:jb_fe/controllers/bloc/order/new_order/add_order_bloc.dart';
import 'package:jb_fe/controllers/bloc/order/order_form_toggle/order_form_toggle_cubit.dart';
import 'package:jb_fe/controllers/bloc/state/authenticated_sidepanel.dart';
import 'package:jb_fe/injection_container.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/pages/dashboard.dart';
import 'package:jb_fe/widgets/body/authenticated/pages/inventory.dart';
import 'package:jb_fe/widgets/body/authenticated/pages/order.dart';
import 'package:jb_fe/widgets/body/authenticated/pages/party.dart';
import 'package:jb_fe/widgets/body/authenticated/pages/payment.dart';
import 'package:jb_fe/widgets/body/authenticated/shop_expenses/shop_expenses.dart';
import 'package:jb_fe/widgets/body/authenticated/side_panel.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/hamburger_top.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/regular_top.dart';

import 'orders/drawer/order_form_drawer.dart';

class AppBodyAuthenticated extends StatelessWidget {
  const AppBodyAuthenticated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        !ScreenSizeUtil.displayDrawer(context) ? SidePanel() : Container(),
        Expanded(
          child: MultiBlocProvider(
            providers: [
              BlocProvider<AddOrderBloc>(
                create: (BuildContext context) =>
                    serviceLocator<AddOrderBloc>(),
              ),
              BlocProvider<OrderFormToggleCubit>(
                create: (context) => OrderFormToggleCubit(),
              )
            ],
            child: Stack(
              children: [
                _getContentSection(),
                BlocBuilder<DailyGoldRateBloc, DailyGoldRateState>(
                  builder: (BuildContext context, DailyGoldRateState state) {
                    if (state.todayGoldRate != null) {
                      print("Adding gold rate");
                      BlocProvider.of<AddOrderBloc>(context).add(
                        AddGoldRate(
                          goldRate: state.todayGoldRate!.rate,
                        ),
                      );
                    }
                    return const OrderFormDrawer();
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _getContentSection() {
    return BlocProvider(
      lazy: false,
      create: (BuildContext context) => serviceLocator<BusinessDataBloc>()
        ..add(
          FetchBusinessData(),
        ),
      child:
          BlocBuilder<AuthenticatedSidePanelCubit, AuthenticatedSidePanelState>(
        builder: (BuildContext context, AuthenticatedSidePanelState state) {
          switch (state) {
            case AuthenticatedSidePanelState.DASHBOARD:
              return const DashboardPage();
            case AuthenticatedSidePanelState.PARTY:
              return const PartyPage();
            case AuthenticatedSidePanelState.INVENTORY:
              return const InventoryPage();
            case AuthenticatedSidePanelState.ORDERS:
              return const OrderPage();
            case AuthenticatedSidePanelState.PAYMENTS:
              return const PaymentPage();
            case AuthenticatedSidePanelState.SHOP_EXPENSES:
              return Column(
                children: [
                  ScreenSizeUtil.getIsHamburgerNavbar(context)
                      ? const HamburgerTopAuthenticatedNavbar()
                      : const RegularTopAuthenticatedNavbar(),
                  const ShopExpenses(),
                ],
              );
          }
        },
      ),
    );
  }
}
