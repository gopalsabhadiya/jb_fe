import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/item_text.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/inputs/button.dart';
import 'package:jb_fe/widgets/common/inputs/checkbox.dart';

class ItemInputTopSection extends StatelessWidget {
  const ItemInputTopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppCheckbox(
          onChanged: _onPublicPrivateChange,
          hint: ItemText.PUBLIC_INPUT_TEXT,
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  AppButton(
                    hint: ItemText.SELECT_IMAGE_INPUT_TEXT,
                    onClick: _onButtonClick,
                    colorScheme: ButtonColorScheme.BLUE,
                  ),
                  AppButton(
                    hint: ItemText.CLEAR_IMAGES_INPUT_TEXT,
                    onClick: _onButtonClick,
                    colorScheme: ButtonColorScheme.RED,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Opacity(
                  opacity: 0.5,
                  child: DottedBorder(
                      dashPattern: const [4, 3],
                      strokeWidth: 2,
                      strokeCap: StrokeCap.butt,
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(8),
                      padding: const EdgeInsets.all(6),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.grey_2,
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 60,
                        ),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.cloud_upload,
                              size: 65,
                              color: AppColors.blue_5,
                            ),
                            AppTextBuilder("Drop Image Here")
                                .size(20)
                                .color(AppColors.blue_5)
                                .build()
                          ],
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppTextBuilder("Ring.jpg").color(AppColors.blue_5).size(16).build(),
            AppTextBuilder("Chain.jpg")
                .color(AppColors.blue_5)
                .size(16)
                .build(),
          ],
        )
      ],
    );
  }

  void _onButtonClick() {
    print("Button clicked");
  }

  _onPublicPrivateChange(bool newValue) {
    print("Checkbox changed to $newValue");
  }
}
