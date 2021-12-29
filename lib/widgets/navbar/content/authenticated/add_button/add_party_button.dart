import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/controllers/bloc/party/party_form_toggle/party_form_toggle_cubit.dart';
import 'package:jb_fe/widgets/common/buttons/icon_button_circle.dart';

class AddPartyButton extends StatelessWidget {
  const AddPartyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppIconButtonCircleBuilder(Icons.add)
        .onClickHandler(
          () => BlocProvider.of<PartyFormToggleCubit>(context).openDrawer(
            toggleForParty: const ToggleForNewParty(),
          ),
        )
        .build();
  }
}
