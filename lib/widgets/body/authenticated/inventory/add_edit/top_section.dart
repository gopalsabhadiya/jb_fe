import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Container(
              width: 20,
              height: 20,
              // decoration: BoxDecoration,
            )
          ],
        ),
        AppTextBuilder("UploadedImages").build()
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
