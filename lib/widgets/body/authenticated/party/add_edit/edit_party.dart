import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/controllers/bloc/party/update_party/update_party_bloc.dart';
import 'package:jb_fe/widgets/body/authenticated/party/add_edit/party_form.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/buttons/icon_button.dart';

class EditParty extends StatefulWidget {
  final VoidCallback _toggleDrawer;
  final PartyPresentation _party;

  const EditParty(
      {Key? key, required toggleDrawer, required PartyPresentation party})
      : _party = party,
        _toggleDrawer = toggleDrawer,
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
          Container(
            color: AppColors.blue_5,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIconButtonBuilder(Icons.arrow_back)
                      .size(25)
                      .onClickHandler(_cancelSave)
                      .color(AppColors.grey_1)
                      .build(),
                  InkWell(
                    onTap: _saveParty,
                    child: AppTextBuilder("Save")
                        .size(20)
                        .weight(AppFontWeight.BOLD)
                        .color(AppColors.grey_1)
                        .paddingHorizontal(20)
                        .build(),
                  )
                ],
              ),
            ),
          ),
          BlocConsumer<UpdatePartyBloc, UpdatePartyState>(
            listener: (BuildContext context, UpdatePartyState state) {
              if (state.updateStatus == UpdatePartyStatus.COMPLETED) {
                widget._toggleDrawer();
              }
            },
            builder: (BuildContext context, UpdatePartyState state) {
              switch (state.updateStatus) {
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
                  return AppTextBuilder("Upps Something went wrong").build();
              }
            },
          ),
          Container()
        ],
      ),
    );
  }

  void _saveParty() {
    print(_formKey.currentState!.validate());
    if (_formKey.currentState!.validate()) {
      print("${widget._party}");
      BlocProvider.of<UpdatePartyBloc>(context)
          .add(UpdateParty(partyPresentation: widget._party));
    }
  }

  void _cancelSave() {
    widget._toggleDrawer();
  }
}
