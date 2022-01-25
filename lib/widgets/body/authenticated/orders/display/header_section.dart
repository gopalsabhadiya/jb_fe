import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class OrderFormHeader extends StatelessWidget {
  final PartyPresentation _party;
  const OrderFormHeader({Key? key, required PartyPresentation party})
      : _party = party,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        decoration: const BoxDecoration(
          color: AppColors.grey_2,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.account_circle,
                      size: 35, color: AppColors.blue_5),
                ),
                AppTextBuilder(_party.name)
                    .weight(AppFontWeight.BOLD)
                    .color(AppColors.blue_5)
                    .build(),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.account_balance_wallet,
                  size: 25,
                  color:
                      _party.balance >= 0 ? AppColors.blue_5 : AppColors.red_2,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppTextBuilder(_party.balance.toString())
                      .weight(AppFontWeight.BOLD)
                      .color(_party.balance >= 0
                          ? AppColors.blue_5
                          : AppColors.red_2)
                      .build(),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.call,
                  size: 25,
                  color: AppColors.blue_5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppTextBuilder(_party.contactNo)
                      .weight(AppFontWeight.BOLD)
                      .color(AppColors.blue_5)
                      .build(),
                ),
              ],
            )
          ],
        ));
  }
}
