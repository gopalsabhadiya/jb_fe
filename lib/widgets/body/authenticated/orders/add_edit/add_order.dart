import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/controllers/bloc/order/new_order/add_order_bloc.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/save_cancel_bar.dart';

import 'order_form.dart';

class AddOrder extends StatefulWidget {
  final VoidCallback _closeDrawer;

  const AddOrder({Key? key, required closeDrawer})
      : _closeDrawer = closeDrawer,
        super(key: key);

  @override
  State<AddOrder> createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
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
          BlocConsumer<AddOrderBloc, AddOrderState>(
            listener: (context, state) {
              if (state.status == AddOrderStatus.COMPLETED) {
                _cancelSave();
              }
            },
            builder: (context, state) {
              switch (state.status) {
                case AddOrderStatus.LOADING:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case AddOrderStatus.BUILDING:
                case AddOrderStatus.COMPLETED:
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: _formKey,
                        child: OrderForm(
                          closeDrawer: widget._closeDrawer,
                        ),
                      ),
                    ),
                  );
                case AddOrderStatus.ERROR:
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
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AddOrderBloc>(context).add(SaveOrder());
    }
  }

  void _cancelSave() {
    widget._closeDrawer();
  }
}
