import 'package:flutter/cupertino.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.grey_1,
          padding: EdgeInsets.all(20),
          child: AppTextBuilder("Dashboard").build(),
        ),
      ],
    );
  }
}
