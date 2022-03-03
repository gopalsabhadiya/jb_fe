import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/injection_container.dart';
import 'package:jb_fe/widgets/body/authenticated/dashboard/sections/stats_section.dart';

import '../../../../controllers/bloc/dashboard/business_stats/business_stats_bloc.dart';
import 'charts/sample.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.blue2WithOpacity(0.3),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                BlocProvider<BusinessStatsBloc>(
                  lazy: false,
                  create: (context) => serviceLocator<BusinessStatsBloc>()
                    ..add(GetBusinessStats()),
                  child: const DashboardStatsSection(),
                ),
                SizedBox(
                  height: 250,
                  width: 250,
                  child: SimpleTimeSeriesChart.withSampleData(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
