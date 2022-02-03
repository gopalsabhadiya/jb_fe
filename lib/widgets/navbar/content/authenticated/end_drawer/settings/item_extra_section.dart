import 'package:flutter/cupertino.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class ItemExtraEditSection extends StatelessWidget {
  const ItemExtraEditSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return AppTextBuilder("Item Extra Section").build();
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: AppTextBuilder("Item Extra Section").build(),
      ),
    );
  }
}
