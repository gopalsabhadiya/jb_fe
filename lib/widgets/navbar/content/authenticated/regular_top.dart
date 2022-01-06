import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/controllers/bloc/authenticated_sidepanel.dart';
import 'package:jb_fe/controllers/bloc/state/authenticated_sidepanel.dart';
import 'package:jb_fe/util/global_keys.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/buttons/icon_button.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/add_button/add_item_button.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/add_button/add_order_button.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/add_button/add_party_button.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/add_button/add_payment_button.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/search_bar/item_seearch_bar.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/search_bar/order_search_bar.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/search_bar/party_search_bar.dart';

class RegularTopAuthenticatedNavbar extends StatelessWidget {
  const RegularTopAuthenticatedNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int counter = 1;

    void _accountOnClickHandler() {
      if (AppGlobalKeys.AUTH_BODY_SCAFFOLD.currentState!.isEndDrawerOpen) {
        Navigator.pop(context);
      } else {
        AppGlobalKeys.AUTH_BODY_SCAFFOLD.currentState!.openEndDrawer();
      }
    }

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // LogoSVG(),
            BlocBuilder<AuthenticatedSidePanelCubit,
                AuthenticatedSidePanelState>(
              builder: (context, state) {
                return Row(
                  children: _getPageActions(state),
                );
              },
            ),
            Row(
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    AppIconButtonBuilder(Icons.notifications)
                        .size(30)
                        .color(AppColors.blue_5)
                        .padding(const EdgeInsets.only(left: 8, right: 8))
                        .build(),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.red_1,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        constraints: const BoxConstraints(
                          maxHeight: 16,
                          maxWidth: 16,
                        ),
                        child: AppTextBuilder("5")
                            .size(10)
                            .weight(AppFontWeight.BOLD)
                            .color(AppColors.grey_1)
                            .build(),
                      ),
                    )
                  ],
                ),
                AppIconButtonBuilder(Icons.shopping_cart)
                    .size(30)
                    .color(AppColors.blue_5)
                    .padding(const EdgeInsets.only(left: 8, right: 8))
                    .build(),
                AppIconButtonBuilder(Icons.account_circle)
                    .size(30)
                    .color(AppColors.blue_5)
                    .padding(const EdgeInsets.only(left: 8, right: 8))
                    .onClickHandler(_accountOnClickHandler)
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

  _getPageActions(AuthenticatedSidePanelState state) {
    switch (state) {
      case AuthenticatedSidePanelState.DASHBOARD:
        return [Container()];
      case AuthenticatedSidePanelState.PARTY:
        return [
          const PartySearchBar(),
          // const FilterPartyButton(),
          const AddPartyButton()
        ];
      case AuthenticatedSidePanelState.INVENTORY:
        return [
          const ItemSearchBar(),
          // const FilterItemButton(),
          const AddItemButton()
        ];
      case AuthenticatedSidePanelState.ORDERS:
        return [
          const OrderSearchBar(),
          // const FilterOrderButton(),
          const AddOrderButton()
        ];
      case AuthenticatedSidePanelState.PAYMENTS:
        return [
          const PartySearchBar(),
          // const FilterPartyButton(),
          const AddPaymentButton()
        ];
      case AuthenticatedSidePanelState.SHOP_EXPENSES:
        return [Container()];
    }
  }
}
