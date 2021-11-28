import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/party_text.dart';
import 'package:jb_fe/widgets/body/authenticated/party/add_edit/party_form_header.dart';
import 'package:jb_fe/widgets/common/inputs/text_field.dart';

class PartyForm extends StatelessWidget {
  const PartyForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Container(
        padding: EdgeInsets.all(40),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const PartyFormHeader(),
            const SizedBox(
              height: 40,
            ),
            AppTextInput(
                prefixIcon: Icons.account_circle,
                hint: PartyText.PARTY_NAME_INPUT_HINT,
                onChanged: _onChanged),
            const SizedBox(
              height: 10,
            ),
            AppTextInput(
                prefixIcon: Icons.call,
                hint: PartyText.CONTACT_NO_INPUT_HINT,
                onChanged: _onChanged),
            const SizedBox(
              height: 10,
            ),
            AppTextInput(
                prefixIcon: Icons.place,
                hint: PartyText.ADDRESS_INPUT_HINT,
                onChanged: _onChanged),
            const SizedBox(
              height: 10,
            ),
            AppTextInput(
                prefixIcon: Icons.store,
                hint: PartyText.GSTIN_INPUT_HINT,
                onChanged: _onChanged),
            const SizedBox(
              height: 10,
            ),
            AppTextInput(
                prefixIcon: Icons.account_balance_wallet,
                hint: PartyText.BALANCE_INPUT_HINT,
                onChanged: _onChanged),
            const SizedBox(
              height: 10,
            ),
            AppTextInput(
                prefixIcon: Icons.email,
                hint: PartyText.EMAIL_INPUT_HINT,
                onChanged: _onChanged),
          ],
        ),
      ),
    );
  }

  _onChanged(String p1) {
    print('Handle Party Inputs');
  }
}
