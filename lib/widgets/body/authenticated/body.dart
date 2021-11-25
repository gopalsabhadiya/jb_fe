import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/controllers/bloc/authenticated_sidepanel.dart';
import 'package:jb_fe/controllers/bloc/state/authenticated_sidepanel.dart';
import 'package:jb_fe/router/delegate.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/side_panel.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

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
          return AppTextBuilder("Dashboard").build();
        case AuthenticatedSidePanelState.PARTY:
          return AppTextBuilder("Party").build();
        case AuthenticatedSidePanelState.INVENTORY:
          return AppTextBuilder("Inventory").build();
        case AuthenticatedSidePanelState.ORDERS:
          return AppTextBuilder("Orders").build();
        case AuthenticatedSidePanelState.PAYMENTS:
          return AppTextBuilder("Payments").build();
        case AuthenticatedSidePanelState.SHOP_EXPENSES:
          return AppTextBuilder("Shop Expenses").build();
      }
    });
    print(
        "Router delegate value:${AppRouterDelegate.linkLocationNotifier.value}");
    if (AppRouterDelegate.linkLocationNotifier.value == "dashboard") {
      return Container(child: AppTextBuilder("Dashboard").build());
    }
    return Container(child: AppTextBuilder("Dummy").build());
  }
}
