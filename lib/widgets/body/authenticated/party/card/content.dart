import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class PartyCardContent extends StatelessWidget {
  const PartyCardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 250, maxHeight: 250),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.call,
                  color: AppColors.blue_5,
                ),
              ),
              AppTextBuilder("+91 8000523940")
                  .size(16)
                  .textAlign(TextAlign.right)
                  .build()
            ]),
            Container(
              color: AppColors.grey_2,
              constraints: BoxConstraints(minHeight: 2),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.place,
                  color: AppColors.blue_5,
                ),
              ),
              Container(
                color: AppColors.grey_2,
                constraints: BoxConstraints(minHeight: 2),
              ),
              Expanded(
                child: AppTextBuilder(
                        "10, purvi soc., hirabaug, varachha road surat- 395006")
                    .size(16)
                    .textAlign(TextAlign.right)
                    .build(),
              )
            ]),
            Container(
              color: AppColors.grey_2,
              constraints: BoxConstraints(minHeight: 2),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.store,
                  color: AppColors.blue_5,
                ),
              ),
              AppTextBuilder("HDGEGI6879")
                  .size(16)
                  .textAlign(TextAlign.right)
                  .build()
            ]),
            Container(
              color: AppColors.grey_2,
              constraints: BoxConstraints(minHeight: 2),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.account_balance_wallet,
                  color: AppColors.blue_5,
                ),
              ),
              AppTextBuilder("10000").size(16).build()
            ]),
            Container(
              color: AppColors.grey_2,
              constraints: BoxConstraints(minHeight: 2),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.email,
                  color: AppColors.blue_5,
                ),
              ),
              AppTextBuilder("gopal.sabhadiya@gmail.com")
                  .size(13)
                  .textAlign(TextAlign.right)
                  .color(AppColors.blue_4)
                  .build()
            ])
          ],
        ),
      ),
    );
  }
}
