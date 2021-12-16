import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class PartyCardContent extends StatelessWidget {
  final String _contact;
  final String _address;
  final String _gstin;
  final double _balance;
  final String _email;
  const PartyCardContent({
    Key? key,
    required String contact,
    String? address,
    String? gstin,
    required double balance,
    String? email,
  })  : _contact = contact,
        _address = address ?? DefaultTexts.NULL_STRING,
        _gstin = gstin ?? DefaultTexts.NULL_STRING,
        _balance = balance,
        _email = email ?? DefaultTexts.NULL_STRING,
        super(key: key);

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
              AppTextBuilder(_contact)
                  .size(16)
                  .textAlign(TextAlign.right)
                  .build()
            ]),
            Container(
              color: AppColors.grey_2,
              constraints: const BoxConstraints(minHeight: 2),
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
                child: AppTextBuilder(_address)
                    .size(16)
                    .color(_address == DefaultTexts.NULL_STRING
                        ? AppColors.red_2
                        : AppColors.black)
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
              AppTextBuilder(_gstin)
                  .size(16)
                  .color(_gstin == DefaultTexts.NULL_STRING
                      ? AppColors.red_2
                      : AppColors.black)
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
              AppTextBuilder(DefaultTexts.RUPEE_SYMBOL +
                      DefaultTexts.SPACE +
                      _balance.toString())
                  .size(16)
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
                  Icons.email,
                  color: AppColors.blue_5,
                ),
              ),
              AppTextBuilder(_email)
                  .size(13)
                  .textAlign(TextAlign.right)
                  .color(_email == DefaultTexts.NULL_STRING
                      ? AppColors.red_2
                      : AppColors.blue_4)
                  .build()
            ])
          ],
        ),
      ),
    );
  }
}
