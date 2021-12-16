import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/controllers/bloc/authenticated_sidepanel.dart';
import 'package:jb_fe/controllers/bloc/state/authenticated_sidepanel.dart';
import 'package:jb_fe/controllers/party_bloc/party_bloc.dart';
import 'package:jb_fe/injection_container.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/dashboard/dashboard.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/inventory.dart';
import 'package:jb_fe/widgets/body/authenticated/orders/orders.dart';
import 'package:jb_fe/widgets/body/authenticated/party/party.dart';
import 'package:jb_fe/widgets/body/authenticated/payments/payments.dart';
import 'package:jb_fe/widgets/body/authenticated/shop_expenses/shop_expenses.dart';
import 'package:jb_fe/widgets/body/authenticated/side_panel.dart';

class AppBodyAuthenticated extends StatelessWidget {
  const AppBodyAuthenticated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        !ScreenSizeUtil.displayDrawer(context) ? SidePanel() : Container(),
        _getContentSection()
      ],
    );
  }

  _getContentSection() {
    return BlocBuilder<AuthenticatedSidePanelCubit,
            AuthenticatedSidePanelState>(
        builder: (BuildContext context, AuthenticatedSidePanelState state) {
      switch (state) {
        case AuthenticatedSidePanelState.DASHBOARD:
          return const Dashboard();
        case AuthenticatedSidePanelState.PARTY:
          return BlocProvider<PartyBloc>(
            create: (BuildContext context) =>
                serviceLocator<PartyBloc>()..add(FetchParties()),
            child: const Party(),
          );
        case AuthenticatedSidePanelState.INVENTORY:
          return const Inventory();
        case AuthenticatedSidePanelState.ORDERS:
          return const Orders();
        case AuthenticatedSidePanelState.PAYMENTS:
          return const Payments();
        case AuthenticatedSidePanelState.SHOP_EXPENSES:
          return const ShopExpenses();
      }
    });
  }
}
