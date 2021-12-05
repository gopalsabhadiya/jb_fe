import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/payment_text.dart';
import 'package:jb_fe/widgets/common/inputs/search_bar.dart';
import 'package:jb_fe/widgets/common/key_value_display.dart';

class PaymentFormTopSection extends StatelessWidget {
  const PaymentFormTopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 300,
          child: AppSearchBarInput(
              hint: PaymentText.SEARCH_PARTY_INPUT_TEXT,
              onChanged: _onChange,
              suffixIconClickHandler: _onClick),
        ),
        const KeyValueDisplay(
          value: "Gopal Sabhadiya",
          iconKey: Icons.account_circle,
          backgroundColor: AppColors.white,
        ),
        const KeyValueDisplay(
          value: "₹ 25,000",
          iconKey: Icons.account_balance_wallet,
          backgroundColor: AppColors.white,
          valueColor: AppColors.red_2,
        ),
        KeyValueDisplay(
          value: "₹ 50,000",
          textKey: PaymentText.UNSORTED_AMMOUNT,
          backgroundColor: AppColors.white,
          valueColor: AppColors.red_2,
        ),
      ],
    );
  }

  _onChange(String input) {
    print("Assign Item med section input on change");
  }

  _onClick() {
    print("On Click called");
  }
}
