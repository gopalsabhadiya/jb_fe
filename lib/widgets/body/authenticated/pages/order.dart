import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/controllers/bloc/order/new_order/add_order_bloc.dart';
import 'package:jb_fe/controllers/bloc/order/order_bloc/order_bloc.dart';
import 'package:jb_fe/injection_container.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/orders/orders.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/hamburger_top.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/regular_top.dart';

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
          const Orders(),
        ],
      ),
    );
  }
}
