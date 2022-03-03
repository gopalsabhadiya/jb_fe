import 'package:flutter/cupertino.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class DashboardStatsSection extends StatelessWidget {
  const DashboardStatsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AppTextBuilder("Hello").color(AppColors.white).build(),
          AppTextBuilder("Hello2").color(AppColors.blue_1).build(),
          AppTextBuilder("Hello3").color(AppColors.blue_2).build(),
          AppTextBuilder("Hello4").color(AppColors.blue_3).build(),
          AppTextBuilder("Hello5").color(AppColors.blue_4).build(),
          AppTextBuilder("Hello6").color(AppColors.blue_5).build(),
          AppTextBuilder("Hello7").color(AppColors.grey_1).build(),
          AppTextBuilder("Hello8").color(AppColors.grey_2).build(),
          AppTextBuilder("Hello9").color(AppColors.grey_3).build(),
          AppTextBuilder("Hello0").color(AppColors.grey_4).build(),
          AppTextBuilder("Helloa").color(AppColors.green_1).build(),
          AppTextBuilder("Hellosd").color(AppColors.red_1).build(),
          AppTextBuilder("Hellowee").color(AppColors.red_2).build(),
        ],
      ),
    );
  }
}
