import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/controllers/bloc/order/new_order/add_order_bloc.dart';
import 'package:jb_fe/controllers/bloc/order/update_order/update_order_bloc.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/save_cancel_bar.dart';

import 'order_form.dart';

class EditOrder extends StatefulWidget {
  final VoidCallback _closeDrawer;
  final OrderPresentation _order;

  const EditOrder(
      {Key? key, required closeDrawer, required OrderPresentation order})
      : _order = order,
        _closeDrawer = closeDrawer,
        super(key: key);

  @override
  State<EditOrder> createState() => _EditOrderState();
}

class _EditOrderState extends State<EditOrder> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey_2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SaveCancelBar(
            cancelCallback: _cancelSave,
            saveCallback: () => _saveCallback(context),
          ),
          BlocConsumer<UpdateOrderBloc, UpdateOrderState>(
            listener: (context, state) {
              if (state.status == AddOrderStatus.COMPLETED) {
                _cancelSave();
              }
            },
            builder: (context, state) {
              switch (state.status) {
                case UpdateOrderStatus.LOADING:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case UpdateOrderStatus.COMPLETED:
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: _formKey,
                        child: OrderForm(
                          order: widget._order,
                          closeDrawer: widget._closeDrawer,
                        ),
                      ),
                    ),
                  );
                case UpdateOrderStatus.ERROR:
                  return AppTextBuilder("Opps Something went wrong").build();
              }
            },
          ),
          Container(),
        ],
      ),
    );
  }

  _saveCallback(BuildContext context) {
    print("Save button clicked");
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<UpdateOrderBloc>(context)
          .add(UpdateOrder(order: widget._order));
      widget._closeDrawer();
    }
  }

  void _cancelSave() {
    widget._closeDrawer();
  }
}
