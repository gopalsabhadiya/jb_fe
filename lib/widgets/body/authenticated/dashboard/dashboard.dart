import 'package:flutter/cupertino.dart';
import 'package:jb_fe/constants/colors.dart';

import 'charts/sample.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.grey_1,
          padding: const EdgeInsets.all(20),
          child: SizedBox(
              height: 250,
              width: 250,
              child: SimpleTimeSeriesChart.withSampleData()),
        ),
      ],
    );
  }
}
