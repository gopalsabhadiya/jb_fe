import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/inputs/text_field.dart';

class BusinessDetailsSection extends StatelessWidget {
  const BusinessDetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              AppTextBuilder("Business Details:")
                  .color(AppColors.blue_5)
                  .size(20)
                  .weight(AppFontWeight.BOLD)
                  .build(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  color: AppColors.grey_3,
                  height: 2,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: AppTextInput(
                  prefixIcon: Icons.storefront,
                  hint: "Enter business name",
                  onChanged: (String value) => print("Business name changed"),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: AppTextInput(
                  prefixIcon: Icons.store,
                  hint: "Enter GST Number",
                  onChanged: (String value) => print("Business name changed"),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: AppTextInput(
                  prefixIcon: Icons.call,
                  hint: "Enter contact no.",
                  onChanged: (String value) => print("Business name changed"),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: AppTextInput(
                  prefixIcon: Icons.call,
                  hint: "Enter alternate contact no.",
                  onChanged: (String value) => print("Business name changed"),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: AppTextInput(
                  prefixIcon: Icons.place,
                  hint: "Enter business address",
                  onChanged: (String value) => print("Business name changed"),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: AppTextInput(
                  prefixIcon: Icons.email,
                  hint: "Enter busienss E-Mail ID",
                  onChanged: (String value) => print("Business name changed"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
