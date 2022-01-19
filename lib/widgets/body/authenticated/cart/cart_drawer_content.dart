import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/controllers/bloc/cart/cart/cart_bloc.dart';
import 'package:jb_fe/widgets/body/authenticated/cart/order_section/order_section.dart';
import 'package:jb_fe/widgets/body/authenticated/cart/party_section/party_selection.dart';
import 'package:jb_fe/widgets/common/save_cancel_bar.dart';

class CartDrawerContent extends StatefulWidget {
  final VoidCallback _closeDrawer;

  const CartDrawerContent({Key? key, required closeDrawer})
      : _closeDrawer = closeDrawer,
        super(key: key);

  @override
  State<CartDrawerContent> createState() => _CartDrawerContentState();
}

class _CartDrawerContentState extends State<CartDrawerContent> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey_2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SaveCancelBar(
            cancelCallback: widget._closeDrawer,
            saveCallback: () => _saveCallback(context),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const PartySelectionForOrder(),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: OrderSectionForCart(
                        closeDrawer: widget._closeDrawer,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(),
        ],
      ),
    );
  }

  _saveCallback(BuildContext context) {
    print("Save button clicked");
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<CartBloc>(context).add(SaveOrder());
      widget._closeDrawer();
    }
  }
}
