import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/controllers/bloc/party/new_party/add_party_bloc.dart';
import 'package:jb_fe/widgets/body/authenticated/party/add_edit/party_form.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/save_cancel_bar.dart';

class AddParty extends StatefulWidget {
  final VoidCallback _closeDrawer;
  final PartyPresentation _party;

  const AddParty({
    Key? key,
    required closeDrawer,
    required PartyPresentation party,
  })  : _party = party,
        _closeDrawer = closeDrawer,
        super(key: key);

  @override
  State<AddParty> createState() => _AddPartyState();
}

class _AddPartyState extends State<AddParty> {
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
          BlocConsumer<AddPartyBloc, AddPartyState>(
            listener: (BuildContext context, AddPartyState state) {
              if (state.status == AddPartyStatus.COMPLETED) {
                widget._closeDrawer();
              }
            },
            builder: (BuildContext context, AddPartyState state) {
              switch (state.status) {
                case AddPartyStatus.LOADING:
                  return const Center(child: CircularProgressIndicator());
                case AddPartyStatus.COMPLETED:
                  return Form(
                    key: _formKey,
                    child: PartyForm(
                      party: widget._party,
                    ),
                  );
                case AddPartyStatus.ERROR:
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
      BlocProvider.of<AddPartyBloc>(context).add(
        AddNewParty(
          partyPresentation: widget._party,
        ),
      );
    }
  }

  void _cancelSave() {
    widget._closeDrawer();
  }
}
