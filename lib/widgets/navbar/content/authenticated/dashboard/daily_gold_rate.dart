import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/backend_integration/dto/daily_gold_rate/daily_gold_rate_presentation.dart';
import 'package:jb_fe/constants/texts/dashboard.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/widgets/common/inputs/text_field.dart';

class DailyGoldRateInput extends StatelessWidget {
  final DailyGoldRatePresentation _dailyGoldRate;
  const DailyGoldRateInput({Key? key, required dailyGoldRate})
      : _dailyGoldRate = dailyGoldRate,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: AppTextInput(
        prefixIcon: Icons.sell,
        hint: DashboardText.ADD_DAILY_GOLD_RATE_HINT,
        tooltip: DashboardText.ADD_DAILY_GOLD_RATE_TOOLTIP,
        onChanged: _dailyGoldRate.setNewRate,
        isNumberInput: true,
        initialValue: _dailyGoldRate.newRate != null
            ? _dailyGoldRate.newRate.toString()
            : DefaultTexts.EMPTY,
      ),
    );
  }

  _onGoldRateChange(String value) {
    print("Gold rate change Search: $value");
  }
}
