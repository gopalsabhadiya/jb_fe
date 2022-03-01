import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/controllers/bloc/authentication/sidepanel/authenticated_sidepanel.dart';
import 'package:jb_fe/controllers/bloc/business/business_data/business_data_bloc.dart';
import 'package:jb_fe/controllers/bloc/end_drawer/profile_or_settings/profile_or_settings_cubit.dart';
import 'package:jb_fe/controllers/bloc/order/new_order/add_order_bloc.dart';
import 'package:jb_fe/controllers/bloc/order/order_form_toggle/order_form_toggle_cubit.dart';
import 'package:jb_fe/util/date_util.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/buttons/icon_button.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/dashboard/navbar_dashboard_content.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/inventory/navbar_inventory_content.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/order/navbar_order_content.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/partry/navbar_party_content.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/payments/navbar_payment_content.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/shop_expenses/navbar_shop_expenses_content.dart';

class RegularTopAuthenticatedNavbar extends StatelessWidget {
  const RegularTopAuthenticatedNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Scaffold.of(context).openEndDrawer();

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // LogoSVG(),
            BlocBuilder<BusinessDataBloc, BusinessDataState>(
              builder:
                  (BuildContext context, BusinessDataState businessDataState) {
                switch (businessDataState.status) {
                  case BusinessDataStatus.LOADING:
                    return const Center(child: CircularProgressIndicator());
                  case BusinessDataStatus.COMPLETED:
                    if (DateUtil.pastDate(
                        businessDataState.business!.subscriptionEnd)) {
                      return Container();
                    }
                    return BlocBuilder<AuthenticatedSidePanelCubit,
                        AuthenticatedSidePanelState>(
                      builder: (BuildContext context,
                          AuthenticatedSidePanelState state) {
                        switch (state) {
                          case AuthenticatedSidePanelState.DASHBOARD:
                            return const NavbarDashboardContent();
                          case AuthenticatedSidePanelState.PARTY:
                            return const NavbarPartyContent();
                          case AuthenticatedSidePanelState.INVENTORY:
                            return const NavbarInventoryContent();
                          case AuthenticatedSidePanelState.ORDERS:
                            return const NavbarOrderContent();
                          case AuthenticatedSidePanelState.PAYMENTS:
                            return const NavbarPaymentContent();
                          case AuthenticatedSidePanelState.SHOP_EXPENSES:
                            return const NavbarShopExpensesContent();
                        }
                      },
                    );
                  case BusinessDataStatus.ERROR:
                    return Container();
                }
              },
            ),
            Row(
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    AppIconButtonBuilder(Icons.shopping_cart)
                        .size(30)
                        .color(AppColors.blue_5)
                        .padding(const EdgeInsets.only(left: 8, right: 8))
                        .onClickHandler(() => _openCart(context))
                        .build(),
                    BlocBuilder<AddOrderBloc, AddOrderState>(
                      builder: (BuildContext context, AddOrderState state) {
                        if (state.order.items.isEmpty) {
                          return Container();
                        }
                        return Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.red_1,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          constraints: const BoxConstraints(
                            maxHeight: 16,
                            maxWidth: 16,
                          ),
                          child: AppTextBuilder(state.totalItemCount.toString())
                              .size(10)
                              .weight(AppFontWeight.BOLD)
                              .color(AppColors.grey_1)
                              .build(),
                        );
                      },
                    ),
                  ],
                ),
                AppIconButtonBuilder(Icons.account_circle)
                    .size(30)
                    .color(AppColors.blue_5)
                    .padding(const EdgeInsets.only(left: 8, right: 8))
                    .onClickHandler(() => _accountOnClickHandler(context))
                    .build(),
              ],
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: AppColors.grey_3.withOpacity(0.5),
              blurRadius: 10.0,
              offset: const Offset(10, 0))
        ],
        color: AppColors.white,
      ),
    );
  }

  _openCart(BuildContext context) {
    BlocProvider.of<OrderFormToggleCubit>(context)
        .openDrawer(toggleForOrder: const ToggleForNewOrder());
  }

  void _accountOnClickHandler(BuildContext context) {
    BlocProvider.of<ProfileOrSettingsCubit>(context).openDrawer(
      toggleFor: const ToggleForProfile(),
    );
    Scaffold.of(context).openEndDrawer();
  }
}
