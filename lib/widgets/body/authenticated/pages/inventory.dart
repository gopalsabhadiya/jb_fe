import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/controllers/bloc/inventory/item_bloc/item_bloc.dart';
import 'package:jb_fe/controllers/bloc/inventory/item_form_toggle/item_form_toggle_cubit.dart';
import 'package:jb_fe/controllers/bloc/order/new_order/add_order_bloc.dart';
import 'package:jb_fe/injection_container.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/inventory.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/hamburger_top.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/regular_top.dart';

import '../../../../controllers/bloc/business/business_data/business_data_bloc.dart';
import '../../../../util/date_util.dart';
import '../../../calligraphy/app_text.dart';
import '../body/subscription_expired/subscription_expired_message.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ItemBloc>(
          create: (BuildContext context) {
            final ItemBloc itemBloc = serviceLocator<ItemBloc>()
              ..add(
                FetchItemFirstPage(
                  cartItems:
                      BlocProvider.of<AddOrderBloc>(context).state.order.items,
                ),
              );
            BlocProvider.of<AddOrderBloc>(context)
                .unSubscribeForItemOperation(itemOperationSubscriber: itemBloc);
            BlocProvider.of<AddOrderBloc>(context)
                .subscribeForItemOperation(itemOperationSubscriber: itemBloc);
            return itemBloc;
          },
        ),
        BlocProvider(
          create: (BuildContext context) =>
              serviceLocator<ItemFormToggleCubit>(),
        )
      ],
      child: Column(
        children: [
          ScreenSizeUtil.getIsHamburgerNavbar(context)
              ? const HamburgerTopAuthenticatedNavbar()
              : const RegularTopAuthenticatedNavbar(),
          BlocBuilder<BusinessDataBloc, BusinessDataState>(
            builder: (BuildContext context, BusinessDataState state) {
              switch (state.status) {
                case BusinessDataStatus.LOADING:
                  return const Center(child: CircularProgressIndicator());
                case BusinessDataStatus.COMPLETED:
                  return DateUtil.pastDate(state.business!.subscriptionEnd)
                      ? const SubscriptionExpiredMessage()
                      : const Inventory();
                case BusinessDataStatus.ERROR:
                  return AppTextBuilder("Something went wrong, try again later")
                      .build();
              }
            },
          ),
        ],
      ),
    );
  }
}
