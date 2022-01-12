import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/controllers/bloc/dashboard/daily_gold_rate/daily_gold_rate_bloc.dart';
import 'package:jb_fe/injection_container.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/dashboard/dashboard.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/hamburger_top.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/regular_top.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DailyGoldRateBloc>(
      create: (context) =>
          serviceLocator<DailyGoldRateBloc>()..add(GetTodayGoldRate()),
      child: Column(
        children: [
          ScreenSizeUtil.getIsHamburgerNavbar(context)
              ? const HamburgerTopAuthenticatedNavbar()
              : const RegularTopAuthenticatedNavbar(),
          const Dashboard(),
        ],
      ),
    );
  }
}
