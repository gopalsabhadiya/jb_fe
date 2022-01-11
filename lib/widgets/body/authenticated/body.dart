import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/controllers/bloc/authenticated_sidepanel.dart';
import 'package:jb_fe/controllers/bloc/business/business_data_bloc.dart';
import 'package:jb_fe/controllers/bloc/cart/cart/cart_bloc.dart';
import 'package:jb_fe/controllers/bloc/cart/cart_form_toggle/cart_form_toggle_cubit.dart';
import 'package:jb_fe/controllers/bloc/state/authenticated_sidepanel.dart';
import 'package:jb_fe/injection_container.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/cart/cart_form_drawer.dart';
import 'package:jb_fe/widgets/body/authenticated/orders/orders.dart';
import 'package:jb_fe/widgets/body/authenticated/pages/dashboard.dart';
import 'package:jb_fe/widgets/body/authenticated/pages/inventory.dart';
import 'package:jb_fe/widgets/body/authenticated/pages/party.dart';
import 'package:jb_fe/widgets/body/authenticated/payments/payments.dart';
import 'package:jb_fe/widgets/body/authenticated/shop_expenses/shop_expenses.dart';
import 'package:jb_fe/widgets/body/authenticated/side_panel.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/hamburger_top.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/regular_top.dart';

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
              BlocProvider<CartBloc>(
                create: (BuildContext context) => serviceLocator<CartBloc>(),
              ),
              BlocProvider<CartFormToggleCubit>(
                create: (context) => CartFormToggleCubit(),
              )
            ],
            child: Stack(
              children: [
                _getContentSection(),
                const CartFormDrawer(),
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
              return Column(
                children: [
                  ScreenSizeUtil.getIsHamburgerNavbar(context)
                      ? const HamburgerTopAuthenticatedNavbar()
                      : const RegularTopAuthenticatedNavbar(),
                  const Orders(),
                ],
              );
            case AuthenticatedSidePanelState.PAYMENTS:
              return Column(
                children: [
                  ScreenSizeUtil.getIsHamburgerNavbar(context)
                      ? const HamburgerTopAuthenticatedNavbar()
                      : const RegularTopAuthenticatedNavbar(),
                  const Payments(),
                ],
              );
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
