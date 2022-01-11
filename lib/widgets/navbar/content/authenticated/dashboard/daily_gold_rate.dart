import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/texts/dashboard.dart';
import 'package:jb_fe/widgets/common/inputs/text_field.dart';

class DailyGoldRateInput extends StatelessWidget {
  const DailyGoldRateInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: AppTextInput(
        prefixIcon: Icons.account_circle,
        hint: DashboardText.ADD_DAILY_GOLD_RATE_HINT,
        tooltip: DashboardText.ADD_DAILY_GOLD_RATE_TOOLTIP,
        onChanged: _onGoldRateChange,
        isNumberInput: true,
      ),
    );
  }

  _onGoldRateChange(String value) {
    print("Gold rate change Search: $value");
  }
}
