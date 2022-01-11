import 'package:flutter/cupertino.dart';
import 'package:jb_fe/widgets/common/buttons/button.dart';

import 'daily_gold_rate.dart';

class NavbarDashboardContent extends StatelessWidget {
  const NavbarDashboardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const DailyGoldRateInput(),
        const SizedBox(
          width: 10,
        ),
        AppButton(
          hint: "Submit",
          onClick: () => print("Dumbo"),
          colorScheme: ButtonColorScheme.BLUE,
        )
      ],
    );
  }
}
