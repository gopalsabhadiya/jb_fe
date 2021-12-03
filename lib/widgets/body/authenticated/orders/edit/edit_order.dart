import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/buttons/icon_button.dart';

import 'order_form.dart';

class EditOrder extends StatelessWidget {
  final VoidCallback _toggleDrawer;

  const EditOrder({Key? key, required toggleDrawer})
      : _toggleDrawer = toggleDrawer,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey_1,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
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
                      .color(AppColors.grey_1)
                      .build(),
                  InkWell(
                    onTap: _saveOrder,
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
          ),
          const Expanded(child: OrderForm()),
        ],
      ),
    );
  }

  void _saveOrder() {
    print("Save Order");
    _toggleDrawer();
  }

  void _cancelSave() {
    print("Cancel Save Order");
    _toggleDrawer();
  }
}
