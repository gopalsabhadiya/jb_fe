import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

import 'buttons/icon_button.dart';

class SaveCancelBar extends StatelessWidget {
  final VoidCallback _cancelSave;
  final VoidCallback _save;
  const SaveCancelBar(
      {Key? key, required cancelCallback, required saveCallback})
      : _cancelSave = cancelCallback,
        _save = saveCallback,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blue_5,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppIconButtonBuilder(Icons.arrow_back)
                .size(25)
                .onClickHandler(_cancelSave)
                .color(AppColors.blue_1)
                .build(),
            InkWell(
              onTap: _save,
              child: AppTextBuilder("Save")
                  .size(20)
                  .weight(AppFontWeight.BOLD)
                  .color(AppColors.grey_1)
                  .paddingHorizontal(20)
                  .build(),
            )
          ],
        ),
      ),
    );
  }
}
