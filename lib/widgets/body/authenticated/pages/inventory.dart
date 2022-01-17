import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/controllers/bloc/cart/cart/cart_bloc.dart';
import 'package:jb_fe/controllers/bloc/inventory/item_bloc/item_bloc.dart';
import 'package:jb_fe/controllers/bloc/inventory/item_form_toggle/item_form_toggle_cubit.dart';
import 'package:jb_fe/injection_container.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/inventory.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/hamburger_top.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/regular_top.dart';

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
                      BlocProvider.of<CartBloc>(context).state.order.items,
                ),
              );
            BlocProvider.of<CartBloc>(context)
                .unSubscribe<ItemBloc>(subscriber: itemBloc);
            BlocProvider.of<CartBloc>(context).subscribe(subscriber: itemBloc);
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
          const Inventory(),
        ],
      ),
    );
  }
}
