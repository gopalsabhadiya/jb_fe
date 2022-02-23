import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/business/business_presentation.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/controllers/bloc/authenticated_sidepanel.dart';
import 'package:jb_fe/controllers/bloc/business/business_data/business_data_bloc.dart';
import 'package:jb_fe/controllers/bloc/dashboard/daily_gold_rate/daily_gold_rate_bloc.dart';
import 'package:jb_fe/controllers/bloc/order/new_order/add_order_bloc.dart';
import 'package:jb_fe/controllers/bloc/order/order_form_toggle/order_form_toggle_cubit.dart';
import 'package:jb_fe/controllers/bloc/state/authenticated_sidepanel.dart';
import 'package:jb_fe/injection_container.dart';
import 'package:jb_fe/util/date_util.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/pages/dashboard.dart';
import 'package:jb_fe/widgets/body/authenticated/pages/inventory.dart';
import 'package:jb_fe/widgets/body/authenticated/pages/order.dart';
import 'package:jb_fe/widgets/body/authenticated/pages/party.dart';
import 'package:jb_fe/widgets/body/authenticated/pages/payment.dart';
import 'package:jb_fe/widgets/body/authenticated/shop_expenses/shop_expenses.dart';
import 'package:jb_fe/widgets/body/authenticated/side_panel.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/hamburger_top.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/regular_top.dart';

import '../../../constants/colors.dart';
import 'orders/drawer/order_form_drawer.dart';

class AppBodyAuthenticated extends StatelessWidget {
  const AppBodyAuthenticated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _showSnackBar(context);
    });
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
                _getContentSection(context),
                BlocBuilder<DailyGoldRateBloc, DailyGoldRateState>(
                  builder: (BuildContext context, DailyGoldRateState state) {
                    if (state.todayGoldRate != null) {
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

  _getContentSection(BuildContext context) {
    return BlocBuilder<AuthenticatedSidePanelCubit,
        AuthenticatedSidePanelState>(
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
    );
  }

  void _showSnackBar(BuildContext context) {
    BusinessPresentation? businessPresentation =
        BlocProvider.of<BusinessDataBloc>(context).state.business;
    if (businessPresentation != null && !businessPresentation.subscribed) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.grey_2,
          duration: const Duration(hours: 24),
          content: SizedBox(
            height: 20.0,
            child: Row(
              children: [
                AppTextBuilder(
                        "You're using trial period. Your subscription expires on: ")
                    .color(AppColors.red_2)
                    .build(),
                AppTextBuilder(
                  DateUtil.dateToString(businessPresentation.subscriptionEnd),
                ).color(AppColors.red_1).weight(AppFontWeight.BOLD).build()
              ],
            ),
          ),
        ),
      );
    }
  }
}
