import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/order/details/order_details_presentation.dart';
import 'package:jb_fe/controllers/bloc/order/delete_order/delete_order_bloc.dart';
import 'package:jb_fe/controllers/bloc/order/order_bloc/order_bloc.dart';
import 'package:jb_fe/controllers/bloc/order/order_form_toggle/order_form_toggle_cubit.dart';
import 'package:jb_fe/injection_container.dart';
import 'package:jb_fe/widgets/body/authenticated/orders/card/order_card.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: BlocBuilder<OrderBloc, OrderState>(
                  builder: (BuildContext context, OrderState state) {
                    switch (state.status) {
                      case OrderStatus.INITIAL:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case OrderStatus.LOADING:
                        _scrollController
                            .jumpTo(_scrollController.position.minScrollExtent);
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case OrderStatus.SUCCESS:
                        return BlocProvider<DeleteOrderBloc>(
                          create: (context) => serviceLocator<DeleteOrderBloc>()
                            ..subscribe(
                              subscriber: BlocProvider.of<OrderBloc>(context),
                            ),
                          child: Wrap(
                            clipBehavior: Clip.hardEdge,
                            spacing: 40,
                            runSpacing: 40,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            alignment: WrapAlignment.center,
                            // children: [
                            //   OrderCard(onOrderEdit: _onOrderEdit, orderId: "1"),
                            // ],
                            children: _getOrders(state.orderList),
                          ),
                        );
                      case OrderStatus.FAILURE:
                        return Center(
                          child:
                              AppTextBuilder("Failed to fetch Orders").build(),
                        );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onScroll() {
    if (_isBottom && _scrollController.position.extentAfter == 0) {
      BlocProvider.of<OrderBloc>(context).add(FetchNextOrderPage());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  _onViewOrder(String orderId) {
    BlocProvider.of<OrderFormToggleCubit>(context).openDrawer(
      toggleForOrder: ToggleForOrderDisplay(orderId: orderId),
    );
  }

  List<Widget> _getOrders(List<OrderDetailsPresentation> orderList) {
    return orderList
        .map(
          (order) => OrderCard(
            onViewOrder: () => _onViewOrder(order.id),
            order: order,
          ),
        )
        .toList();
  }
}
