import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/daily_gold_rate/daily_gold_rate_presentation.dart';
import 'package:jb_fe/controllers/bloc/dashboard/daily_gold_rate/daily_gold_rate_bloc.dart';
import 'package:jb_fe/controllers/bloc/dashboard/new_daily_gold_rate/add_daily_gold_rate_bloc.dart';
import 'package:jb_fe/injection_container.dart';
import 'package:jb_fe/widgets/common/buttons/button.dart';

import 'daily_gold_rate.dart';

class AddDailyGoldRateContent extends StatelessWidget {
  final DailyGoldRatePresentation _dailyGoldRate;

  const AddDailyGoldRateContent({Key? key, required dailyGoldRate})
      : _dailyGoldRate = dailyGoldRate,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddDailyGoldRateBloc>(
      create: (context) => serviceLocator<AddDailyGoldRateBloc>()
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
              onClick: () => _addTodayGoldRate(context),
              colorScheme: ButtonColorScheme.BLUE,
            );
          })
        ],
      ),
    );
  }

  _addTodayGoldRate(BuildContext context) {
    BlocProvider.of<AddDailyGoldRateBloc>(context).add(
      AddDailyGoldRate(
        dailyGoldRate: _dailyGoldRate,
      ),
    );
  }
}
