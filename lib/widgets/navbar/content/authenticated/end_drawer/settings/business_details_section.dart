import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/backend_integration/dto/business/business_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/inputs/text_field.dart';

class BusinessDetailsSection extends StatelessWidget {
  final BusinessPresentation _business;
  const BusinessDetailsSection(
      {Key? key, required BusinessPresentation business})
      : _business = business,
        super(key: key);

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
                  onChanged: _business.setName,
                  initialValue: _business.name,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: AppTextInput(
                  prefixIcon: Icons.store,
                  hint: "Enter GST Number",
                  onChanged: _business.setGstin,
                  initialValue: _business.gstin,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: AppTextInput(
                  prefixIcon: Icons.call,
                  hint: "Enter contact no.",
                  onChanged: _business.setFirstContactNo,
                  initialValue: _business.contactNo.first.toString(),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: AppTextInput(
                  prefixIcon: Icons.call,
                  hint: "Enter alternate contact no.",
                  onChanged: _business.setAlternateContactNo,
                  initialValue: _business.contactNo.length > 1
                      ? _business.contactNo[1].toString()
                      : DefaultTexts.EMPTY,
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
                  onChanged: _business.setAddress,
                  initialValue: _business.address,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: AppTextInput(
                  prefixIcon: Icons.email,
                  hint: "Enter busienss E-Mail ID",
                  onChanged: _business.setEmail,
                  initialValue: _business.email,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
