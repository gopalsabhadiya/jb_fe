import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/party_text.dart';
import 'package:jb_fe/controllers/bloc/party/delete_party/delete_party_bloc.dart';
import 'package:jb_fe/widgets/body/authenticated/party/card/content.dart';
import 'package:jb_fe/widgets/body/authenticated/party/card/footer.dart';
import 'package:jb_fe/widgets/body/authenticated/party/card/header.dart';
import 'package:jb_fe/widgets/common/alerts/confirmation_alert.dart';

class PartyCard extends StatelessWidget {
  final Function(PartyPresentation) _onPartyEdit;
  final PartyPresentation _party;
  const PartyCard({Key? key, required onPartyEdit, required party})
      : _onPartyEdit = onPartyEdit,
        _party = party,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          minWidth: 250, minHeight: 350, maxWidth: 250, maxHeight: 350),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
                offset: Offset(2, 2),
                color: AppColors.grey_3, //edited
                spreadRadius: 1,
                blurRadius: 5 //edited
                )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PartyCardHeader(name: _party.name),
          PartyCardContent(
              contact: _party.contactNo,
              address: _party.address,
              gstin: _party.gstin,
              balance: _party.balance,
              email: _party.email),
          PartyCardFooter(
            partyType: _party.type,
            partyId: _party.id,
            onPartyFavourite: _onPartyFavouriteClick,
            onPartyEdit: _onPartyEditClick,
            onPartyDelete: () => _onPartyDeleteClick(context),
          ),
        ],
      ),
    );
  }

  _onPartyFavouriteClick() {
    print("Party favourite: ${_party.partyId}");
  }

  _onPartyEditClick() {
    _onPartyEdit(_party);
  }

  _onPartyDeleteClick(BuildContext parentContext) {
    showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return ConfirmationAlert(
            title: PartyText.DELETE_PARTY_ALERT_HEADER,
            content: PartyText.DELETE_PARTY_ALERT_MESSAGE,
            variable: _party.name,
            continueCallBack: () {
              Navigator.of(context).pop();
              _deleteParty(parentContext);
            });
      },
    );
  }

  _deleteParty(BuildContext context) {
    BlocProvider.of<DeletePartyBloc>(context)
        .add(DeleteParty(partyIdToBeDeleted: _party.id));
  }
}
