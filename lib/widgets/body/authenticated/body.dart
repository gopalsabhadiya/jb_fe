import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/controllers/bloc/authenticated_sidepanel.dart';
import 'package:jb_fe/controllers/bloc/party/party_bloc/party_bloc.dart';
import 'package:jb_fe/controllers/bloc/state/authenticated_sidepanel.dart';
import 'package:jb_fe/injection_container.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/dashboard/dashboard.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/inventory.dart';
import 'package:jb_fe/widgets/body/authenticated/orders/orders.dart';
import 'package:jb_fe/widgets/body/authenticated/party/party.dart';
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
          child: _getContentSection(),
        ),
      ],
    );
  }

  _getContentSection() {
    return BlocBuilder<AuthenticatedSidePanelCubit,
            AuthenticatedSidePanelState>(
        builder: (BuildContext context, AuthenticatedSidePanelState state) {
      switch (state) {
        case AuthenticatedSidePanelState.DASHBOARD:
          return Column(
            children: [
              ScreenSizeUtil.getIsHamburgerNavbar(context)
                  ? const HamburgerTopAuthenticatedNavbar()
                  : const RegularTopAuthenticatedNavbar(),
              const Dashboard(),
            ],
          );
        case AuthenticatedSidePanelState.PARTY:
          return BlocProvider<PartyBloc>(
            create: (BuildContext context) =>
                serviceLocator<PartyBloc>()..add(FetchParties()),
            child: Column(
              children: [
                ScreenSizeUtil.getIsHamburgerNavbar(context)
                    ? const HamburgerTopAuthenticatedNavbar()
                    : const RegularTopAuthenticatedNavbar(),
                const Party(),
              ],
            ),
          );
        case AuthenticatedSidePanelState.INVENTORY:
          return Column(
            children: [
              ScreenSizeUtil.getIsHamburgerNavbar(context)
                  ? const HamburgerTopAuthenticatedNavbar()
                  : const RegularTopAuthenticatedNavbar(),
              const Inventory(),
            ],
          );
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
    });
  }
}
