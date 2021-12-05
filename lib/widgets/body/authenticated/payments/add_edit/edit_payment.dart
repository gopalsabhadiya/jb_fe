import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/body/authenticated/payments/add_edit/payment_form.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/buttons/icon_button.dart';

class EditPayment extends StatelessWidget {
  final VoidCallback _toggleDrawer;

  const EditPayment({Key? key, required toggleDrawer})
      : _toggleDrawer = toggleDrawer,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey_2,
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
                    onTap: _saveItem,
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
          Expanded(child: const PaymentForm()),
        ],
      ),
    );
  }

  void _saveItem() {
    print("Save Item");
    _toggleDrawer();
  }

  void _cancelSave() {
    print("Cancel Save Item");
    _toggleDrawer();
  }
}
