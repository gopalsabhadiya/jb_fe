import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/buttons/icon_button.dart';

class ItemCardFooter extends StatelessWidget {
  final VoidCallback _onItemEdit;
  final VoidCallback _onItemView;
  final VoidCallback _onItemDelete;

  const ItemCardFooter(
      {Key? key,
      required onItemEdit,
      required onItemView,
      required onItemDelete})
      : _onItemEdit = onItemEdit,
        _onItemView = onItemView,
        _onItemDelete = onItemDelete,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          minWidth: 250, minHeight: 50, maxWidth: 250, maxHeight: 50),
      decoration: const BoxDecoration(
        color: AppColors.grey_2,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppTextBuilder("NW: ").color(AppColors.blue_5).size(16).build(),
                AppTextBuilder("4.1000")
                    .color(AppColors.blue_5)
                    .size(16)
                    .weight(AppFontWeight.BOLD)
                    .build(),
                AppTextBuilder("GM").color(AppColors.blue_5).size(10).build(),
              ],
            ),
            Row(
              children: [
                AppIconButtonBuilder(Icons.visibility)
                    .size(25)
                    .onClickHandler(_onItemView)
                    .padding(EdgeInsets.all(3))
                    .color(AppColors.green_1)
                    .build(),
                AppIconButtonBuilder(Icons.edit)
                    .size(25)
                    .onClickHandler(_onItemEdit)
                    .padding(EdgeInsets.all(3))
                    .color(AppColors.blue_5)
                    .build(),
                AppIconButtonBuilder(Icons.delete)
                    .size(25)
                    .onClickHandler(_onItemDelete)
                    .padding(EdgeInsets.all(3))
                    .color(AppColors.red_2)
                    .build(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
