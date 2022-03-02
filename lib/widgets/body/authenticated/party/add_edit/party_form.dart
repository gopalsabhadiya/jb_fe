import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/party_text.dart';
import 'package:jb_fe/widgets/body/authenticated/party/add_edit/party_form_header.dart';
import 'package:jb_fe/widgets/common/inputs/text_field.dart';

class PartyForm extends StatefulWidget {
  final PartyPresentation _party;
  const PartyForm({Key? key, required party})
      : _party = party,
        super(key: key);

  @override
  State<PartyForm> createState() => _PartyFormState();
}

class _PartyFormState extends State<PartyForm> {
  late final List<FocusNode> _focusNodeList;

  @override
  void initState() {
    _focusNodeList = [
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode()
    ];
    super.initState();
  }

  @override
  void dispose() {
    for (var focusNode in _focusNodeList) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Container(
        padding: const EdgeInsets.all(20),
        constraints: const BoxConstraints(maxWidth: 1000),
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
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PartyFormHeader(party: widget._party),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: AppTextInput(
                    onEditingComplete: () => _focusNextTextBox(0),
                    focusNode: _focusNodeList[0],
                    validator: widget._party.nameValidator,
                    initialValue: widget._party.newName,
                    prefixIcon: Icons.account_circle,
                    hint: PartyText.PARTY_NAME_INPUT_HINT,
                    tooltip: PartyText.PARTY_NAME_TOOLTIP,
                    onChanged: widget._party.setNewName,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: AppTextInput(
                    onEditingComplete: () => _focusNextTextBox(1),
                    focusNode: _focusNodeList[1],
                    validator: widget._party.contactNoValidator,
                    initialValue: widget._party.newContactNo,
                    prefixIcon: Icons.call,
                    hint: PartyText.CONTACT_NO_INPUT_HINT,
                    tooltip: PartyText.CONATCT_NO_TOOLTIP,
                    onChanged: widget._party.setNewContactNo,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            AppTextInput(
              onEditingComplete: () => _focusNextTextBox(2),
              focusNode: _focusNodeList[2],
              initialValue: widget._party.newAddress,
              prefixIcon: Icons.place,
              hint: PartyText.ADDRESS_INPUT_HINT,
              tooltip: PartyText.ADDRESS_TOOLTIP,
              onChanged: widget._party.setNewAddress,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: AppTextInput(
                    onEditingComplete: () => _focusNextTextBox(3),
                    focusNode: _focusNodeList[3],
                    validator: widget._party.gstinValidator,
                    initialValue: widget._party.newGstin,
                    prefixIcon: Icons.store,
                    hint: PartyText.GSTIN_INPUT_HINT,
                    tooltip: PartyText.GSTIN_TOOLTIP,
                    onChanged: widget._party.setNewGstin,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: AppTextInput(
                    onEditingComplete: () => _focusNextTextBox(4),
                    focusNode: _focusNodeList[4],
                    validator: widget._party.balanceValidator,
                    initialValue: widget._party.newBalance.toString(),
                    prefixIcon: Icons.account_balance_wallet,
                    hint: PartyText.BALANCE_INPUT_HINT,
                    tooltip: PartyText.BALANCE_TOOLTIP,
                    onChanged: widget._party.setNewBalance,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: AppTextInput(
                    onEditingComplete: () => _focusNextTextBox(5),
                    focusNode: _focusNodeList[5],
                    validator: widget._party.aadharNoValidator,
                    initialValue: widget._party.newAadharNo,
                    prefixIcon: Icons.badge,
                    hint: PartyText.AADHAR_INPUT_HINT,
                    tooltip: PartyText.AADHAR_TOOLTIP,
                    onChanged: widget._party.setNewAadharNo,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: AppTextInput(
                    onEditingComplete: () => _focusNextTextBox(6),
                    focusNode: _focusNodeList[6],
                    validator: widget._party.panNoValidator,
                    initialValue: widget._party.newPanNo,
                    prefixIcon: Icons.badge,
                    hint: PartyText.PAN_INPUT_HINT,
                    tooltip: PartyText.PAN_TOOLTIP,
                    onChanged: widget._party.setNewPanNo,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            AppTextInput(
              onEditingComplete: () => _focusNextTextBox(7),
              focusNode: _focusNodeList[7],
              validator: widget._party.emailValidator,
              initialValue: widget._party.newEmail,
              prefixIcon: Icons.email,
              hint: PartyText.EMAIL_INPUT_HINT,
              tooltip: PartyText.EMAIL_TOOLTIP,
              onChanged: widget._party.setNewEmail,
            ),
          ],
        ),
      ),
    );
  }

  _focusNextTextBox(int currentNodeIndex) {
    if (currentNodeIndex + 1 < _focusNodeList.length) {
      _focusNodeList[currentNodeIndex + 1].requestFocus();
    }
  }
}
