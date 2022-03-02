import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/controllers/bloc/receipt/new_receipt/add_receipt_bloc.dart';
import 'package:jb_fe/widgets/body/authenticated/payments/add_edit/receipt_section/receipt_secton.dart';
import 'package:jb_fe/widgets/common/inputs/party_section/party_selection.dart';

class PaymentForm extends StatelessWidget {
  final VoidCallback _closeDrawer;

  const PaymentForm({
    Key? key,
    required closeDrawer,
  })  : _closeDrawer = closeDrawer,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BlocBuilder<AddReceiptBloc, AddReceiptState>(
          builder: (context, state) {
            return PartySelectionAndDisplay(
              onPartySelected: (PartyPresentation party) =>
                  _onPartySelected(party, context),
              party: state.party,
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ReceiptSectionForPayment(
            closeDrawer: _closeDrawer,
          ),
        )
      ],
    );
  }

  void _onPartySelected(PartyPresentation party, BuildContext context) {
    BlocProvider.of<AddReceiptBloc>(context)
        .add(AddPartyToReceipt(party: party));
  }
}
