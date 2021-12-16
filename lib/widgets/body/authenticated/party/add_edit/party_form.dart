import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/party_text.dart';
import 'package:jb_fe/widgets/body/authenticated/party/add_edit/party_form_header.dart';
import 'package:jb_fe/widgets/common/inputs/text_field.dart';

class PartyForm extends StatelessWidget {
  final PartyPresentation _party;
  const PartyForm({Key? key, required party})
      : _party = party,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Container(
        padding: EdgeInsets.all(20),
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
            PartyFormHeader(party: _party),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: AppTextInput(
                      validator: _party.nameValidator,
                      initialValue: _party.newName,
                      prefixIcon: Icons.account_circle,
                      hint: PartyText.PARTY_NAME_INPUT_HINT,
                      tooltip: PartyText.PARTY_NAME_TOOLTIP,
                      onChanged: _party.setNewName),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: AppTextInput(
                      validator: _party.contactNoValidator,
                      initialValue: _party.newContactNo,
                      prefixIcon: Icons.call,
                      hint: PartyText.CONTACT_NO_INPUT_HINT,
                      tooltip: PartyText.CONATCT_NO_TOOLTIP,
                      onChanged: _party.setNewContactNo),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            AppTextInput(
                initialValue: _party.newAddress,
                prefixIcon: Icons.place,
                hint: PartyText.ADDRESS_INPUT_HINT,
                tooltip: PartyText.ADDRESS_TOOLTIP,
                onChanged: _party.setNewAddress),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: AppTextInput(
                      validator: _party.gstinValidator,
                      initialValue: _party.newGstin,
                      prefixIcon: Icons.store,
                      hint: PartyText.GSTIN_INPUT_HINT,
                      tooltip: PartyText.GSTIN_TOOLTIP,
                      onChanged: _party.setNewGstin),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: AppTextInput(
                      validator: _party.balanceValidator,
                      initialValue: _party.newBalance.toString(),
                      prefixIcon: Icons.account_balance_wallet,
                      hint: PartyText.BALANCE_INPUT_HINT,
                      tooltip: PartyText.BALANCE_TOOLTIP,
                      onChanged: _party.setNewBalance),
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
                      validator: _party.panNoValidator,
                      initialValue: _party.newPanNo,
                      prefixIcon: Icons.badge,
                      hint: PartyText.AADHAR_INPUT_HINT,
                      tooltip: PartyText.AADHAR_TOOLTIP,
                      onChanged: _party.setNewPanNo),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: AppTextInput(
                      validator: _party.aadharNoValidator,
                      initialValue: _party.newAadharNo,
                      prefixIcon: Icons.badge,
                      hint: PartyText.PAN_INPUT_HINT,
                      tooltip: PartyText.PAN_TOOLTIP,
                      onChanged: _party.setNewBalance),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            AppTextInput(
                validator: _party.emailValidator,
                initialValue: _party.newEmail,
                prefixIcon: Icons.email,
                hint: PartyText.EMAIL_INPUT_HINT,
                tooltip: PartyText.EMAIL_TOOLTIP,
                onChanged: _party.setNewEmail),
          ],
        ),
      ),
    );
  }
}
