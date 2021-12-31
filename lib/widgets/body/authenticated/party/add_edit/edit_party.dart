import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/controllers/bloc/party/update_party/update_party_bloc.dart';
import 'package:jb_fe/widgets/body/authenticated/party/add_edit/party_form.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/save_cancel_bar.dart';

class EditParty extends StatefulWidget {
  final VoidCallback _closeDrawer;
  final PartyPresentation _party;

  const EditParty({
    Key? key,
    required closeDrawer,
    required PartyPresentation party,
  })  : _party = party,
        _closeDrawer = closeDrawer,
        super(key: key);

  @override
  State<EditParty> createState() => _EditPartyState();
}

class _EditPartyState extends State<EditParty> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey_1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SaveCancelBar(
            cancelCallback: _cancelSave,
            saveCallback: _updateParty,
          ),
          BlocConsumer<UpdatePartyBloc, UpdatePartyState>(
            listener: (BuildContext context, UpdatePartyState state) {
              if (state.status == UpdatePartyStatus.COMPLETED) {
                widget._closeDrawer();
              }
            },
            builder: (BuildContext context, UpdatePartyState state) {
              switch (state.status) {
                case UpdatePartyStatus.LOADING:
                  return const Center(child: CircularProgressIndicator());
                case UpdatePartyStatus.COMPLETED:
                  return Form(
                    key: _formKey,
                    child: PartyForm(
                      party: widget._party,
                    ),
                  );
                case UpdatePartyStatus.ERROR:
                  return AppTextBuilder("Opps Something went wrong").build();
              }
            },
          ),
          Container()
        ],
      ),
    );
  }

  void _updateParty() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<UpdatePartyBloc>(context)
          .add(UpdateParty(party: widget._party));
    }
  }

  void _cancelSave() {
    widget._closeDrawer();
  }
}
