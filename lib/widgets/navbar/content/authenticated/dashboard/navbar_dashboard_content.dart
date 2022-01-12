import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/daily_gold_rate/daily_gold_rate_presentation.dart';
import 'package:jb_fe/controllers/bloc/dashboard/daily_gold_rate/daily_gold_rate_bloc.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/dashboard/add_daily_gold_rate_content.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/dashboard/update_daily_gold_rate_content.dart';

class NavbarDashboardContent extends StatelessWidget {
  const NavbarDashboardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailyGoldRateBloc, DailyGoldRateState>(
      builder: (context, state) {
        if (state.status == DailyGoldRateStatus.LOADING) {
          return const SizedBox(
            height: 20,
            child: CircularProgressIndicator(),
          );
        }
        if (state.todayGoldRateAvailable) {
          return UpdateDailyGoldRateContent(dailyGoldRate: state.todayGoldRate);
        }
        return AddDailyGoldRateContent(
          dailyGoldRate: DailyGoldRatePresentation.empty(),
        );
      },
    );
  }
}
