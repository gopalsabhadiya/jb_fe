import 'package:flutter/cupertino.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/widgets/body/authenticated/party/card/content.dart';
import 'package:jb_fe/widgets/body/authenticated/party/card/footer.dart';
import 'package:jb_fe/widgets/body/authenticated/party/card/header.dart';

class PartyCard extends StatelessWidget {
  final Function(String) _onPartyEdit;
  final String _partyId;
  const PartyCard({Key? key, required onPartyEdit, required partyId})
      : _onPartyEdit = onPartyEdit,
        _partyId = partyId,
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
          PartyCardHeader(),
          PartyCardContent(),
          PartyCardFooter(
            onPartyFavourite: _onPartyFavouriteClick,
            onPartyEdit: _onPartyEditClick,
            onPartyDelete: _onPartyDeleteClick,
          ),
        ],
      ),
    );
  }

  _onPartyFavouriteClick() {
    print("Party favourite: $_partyId");
  }

  _onPartyEditClick() {
    _onPartyEdit(_partyId);
  }

  _onPartyDeleteClick() {
    print("Party Deleted: $_partyId");
  }
}
