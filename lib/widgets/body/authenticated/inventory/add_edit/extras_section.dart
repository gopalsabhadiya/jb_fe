import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/item_text.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/add_edit/extra_item.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/inputs/button.dart';

class ItemInputExtrasSection extends StatelessWidget {
  final ScrollController controller = ScrollController();

  ItemInputExtrasSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
                offset: Offset(2, 2),
                color: AppColors.grey_3, //edited
                spreadRadius: 1,
                blurRadius: 4 //edited
                )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppTextBuilder(ItemText.EXTRA_ITEM_TEXT)
                        .size(30)
                        .color(AppColors.blue_5)
                        .build(),
                    AppButton(
                      icon: Icons.add_circle,
                      hint: ItemText.ADD_EXTRA_INPUT_TEXT,
                      onClick: _onButtonClick,
                      colorScheme: ButtonColorScheme.BLUE,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: AppColors.blue_1,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(5), bottom: Radius.circular(5)),
                ),
                child: Scrollbar(
                  isAlwaysShown: true,
                  interactive: true,
                  controller: controller,
                  child: ListView(
                    controller: controller,
                    children: [
                      ExtraItemForm(),
                      ExtraItemForm(),
                      ExtraItemForm(),
                      ExtraItemForm(),
                      ExtraItemForm(),
                      ExtraItemForm()
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onButtonClick() {
    print("Button clicked");
  }
}
