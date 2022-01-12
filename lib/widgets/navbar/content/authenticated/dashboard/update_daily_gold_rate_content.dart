import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/daily_gold_rate/daily_gold_rate_presentation.dart';
import 'package:jb_fe/controllers/bloc/dashboard/daily_gold_rate/daily_gold_rate_bloc.dart';
import 'package:jb_fe/controllers/bloc/dashboard/update_daily_gold_rate/update_daily_gold_rate_bloc.dart';
import 'package:jb_fe/injection_container.dart';
import 'package:jb_fe/widgets/common/buttons/button.dart';

import 'daily_gold_rate.dart';

class UpdateDailyGoldRateContent extends StatelessWidget {
  final DailyGoldRatePresentation _dailyGoldRate;

  const UpdateDailyGoldRateContent({Key? key, required dailyGoldRate})
      : _dailyGoldRate = dailyGoldRate,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<UpdateDailyGoldRateBloc>()
        ..subscribe(
          subscriber: BlocProvider.of<DailyGoldRateBloc>(context),
        ),
      child: Row(
        children: [
          DailyGoldRateInput(
            dailyGoldRate: _dailyGoldRate,
          ),
          const SizedBox(
            width: 10,
          ),
          Builder(builder: (context) {
            return AppButton(
              hint: "Submit",
              onClick: () => _updateTodayGoldRate(context),
              colorScheme: ButtonColorScheme.BLUE,
            );
          })
        ],
      ),
    );
  }

  _updateTodayGoldRate(BuildContext context) {
    print("OnClickExecuted");
    BlocProvider.of<UpdateDailyGoldRateBloc>(context).add(
      UpdateDailyGoldRate(
        dailyGoldRate: _dailyGoldRate,
      ),
    );
  }
}
