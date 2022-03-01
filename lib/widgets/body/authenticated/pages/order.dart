import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/controllers/bloc/order/new_order/add_order_bloc.dart';
import 'package:jb_fe/controllers/bloc/order/order_bloc/order_bloc.dart';
import 'package:jb_fe/injection_container.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/orders/orders.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/hamburger_top.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/regular_top.dart';

import '../../../../controllers/bloc/business/business_data/business_data_bloc.dart';
import '../../../../util/date_util.dart';
import '../../../calligraphy/app_text.dart';
import '../body/subscription_expired/subscription_expired_message.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Order page rendering');
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderBloc>(create: (BuildContext context) {
          OrderBloc orderBloc = serviceLocator<OrderBloc>()
            ..add(
              FetchOrderFirstPage(),
            );
          BlocProvider.of<AddOrderBloc>(context)
              .subscribe(subscriber: orderBloc);
          return orderBloc;
        }),
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
                      : const Orders();
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
