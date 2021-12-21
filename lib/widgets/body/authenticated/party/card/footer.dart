import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/constants/enum/party_type_enum.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/controllers/delete_party/delete_party_bloc.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/buttons/icon_button.dart';

class PartyCardFooter extends StatelessWidget {
  final PartyTypeEnum _partyType;
  final String _partyId;
  final VoidCallback _onPartyFavourite;
  final VoidCallback _onPartyEdit;
  final VoidCallback _onPartyDelete;

  const PartyCardFooter(
      {Key? key,
      required onPartyFavourite,
      required partyId,
      required onPartyEdit,
      required onPartyDelete,
      required partyType})
      : _partyType = partyType,
        _partyId = partyId,
        _onPartyFavourite = onPartyFavourite,
        _onPartyEdit = onPartyEdit,
        _onPartyDelete = onPartyDelete,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          minWidth: 250, minHeight: 50, maxWidth: 250, maxHeight: 50),
      decoration: const BoxDecoration(
        color: AppColors.grey_2,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppTextBuilder(_partyType.name()).color(AppColors.green_1).build(),
            Row(
              children: [
                AppIconButtonBuilder(Icons.grade_outlined)
                    .size(25)
                    .onClickHandler(_onPartyFavourite)
                    .padding(EdgeInsets.all(3))
                    .build(),
                AppIconButtonBuilder(Icons.edit)
                    .size(25)
                    .onClickHandler(_onPartyEdit)
                    .padding(EdgeInsets.all(3))
                    .color(AppColors.blue_5)
                    .build(),
                BlocBuilder<DeletePartyBloc, DeletePartyState>(
                    builder: (context, state) {
                  if (_partyId == state.lastDeletedPartyId &&
                      state.deleteStatus == DeletePartyStatus.LOADING) {
                    return const Padding(
                      padding: EdgeInsets.all(5.5),
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(AppColors.red_2),
                        ),
                      ),
                    );
                  }
                  return AppIconButtonBuilder(Icons.delete)
                      .size(25)
                      .onClickHandler(_onPartyDelete)
                      .padding(EdgeInsets.all(3))
                      .color(AppColors.red_2)
                      .build();
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
