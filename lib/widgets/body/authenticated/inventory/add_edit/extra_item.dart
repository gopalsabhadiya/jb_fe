import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/item_text.dart';
import 'package:jb_fe/widgets/common/inputs/text_field.dart';
import 'package:jb_fe/widgets/svg/icons/app_icons.dart';

class ExtraItemForm extends StatelessWidget {
  const ExtraItemForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, top: 5, right: 5, left: 5),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
                color: AppColors.grey_3, //edited
                spreadRadius: 1,
                blurRadius: 3 //edited
                )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AppTextInput(
                      prefixIcon: AppIcons.crystal,
                      hint: ItemText.EXTRA_TYPE_INPUT_TEXT,
                      onChanged: _onChange,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppTextInput(
                      prefixIcon: Icons.extension,
                      hint: ItemText.EXTRA_PIECE_INPUT_TEXT,
                      onChanged: _onChange,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AppTextInput(
                      prefixIcon: Icons.engineering,
                      hint: ItemText.EXTRA_LABOUR_INPUT_TEXT,
                      onChanged: _onChange,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppTextInput(
                      prefixIcon: Icons.local_offer,
                      hint: ItemText.EXTRA_ITEM_RATE_INPUT_TEXT,
                      onChanged: _onChange,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: IconButton(
                  onPressed: _onClick,
                  icon: const Icon(
                    Icons.cancel,
                    size: 35,
                    color: AppColors.red_2,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onChange(String value) {
    print("Input Changed");
  }

  void _onClick() {
    print("Close Clicked");
  }
}
