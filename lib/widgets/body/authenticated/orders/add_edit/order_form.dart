import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/controllers/bloc/order/new_order/add_order_bloc.dart';
import 'package:jb_fe/widgets/common/inputs/party_section/party_selection.dart';

import 'order_section/order_section.dart';

class OrderForm extends StatelessWidget {
  final VoidCallback _closeDrawer;
  const OrderForm({Key? key, required closeDrawer})
      : _closeDrawer = closeDrawer,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PartySelectionAndDisplay(
          onPartySelected: (PartyPresentation party) =>
              _onPartySelected(party, context),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: OrderSectionForCart(
            closeDrawer: _closeDrawer,
          ),
        ),
      ],
    );
  }

  void _onPartySelected(PartyPresentation party, BuildContext context) {
    BlocProvider.of<AddOrderBloc>(context).add(AddPartyToOrder(party: party));
  }
}
