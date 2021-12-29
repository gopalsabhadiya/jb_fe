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
  static const double _iconSize = 25;
  static const double _fontSize = 16;
  const PartyCardContent({
    Key? key,
    required String contact,
    String? address,
    String? gstin,
    required double balance,
    String? email,
  })  : _contact = contact,
        _address = address == null || address.length == 0
            ? DefaultTexts.NULL_STRING
            : address,
        _gstin = gstin == null || gstin.length == 0
            ? DefaultTexts.NULL_STRING
            : gstin,
        _balance = balance,
        _email = email == null || email.length == 0
            ? DefaultTexts.NULL_STRING
            : email,
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
                  size: _iconSize,
                  color: AppColors.blue_5,
                ),
              ),
              AppTextBuilder(_contact)
                  .size(_fontSize)
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
                  size: _iconSize,
                  color: AppColors.blue_5,
                ),
              ),
              Container(
                color: AppColors.grey_2,
                constraints: BoxConstraints(minHeight: 2),
              ),
              Expanded(
                child: AppTextBuilder(_address)
                    .size(_fontSize)
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
                  size: _iconSize,
                  color: AppColors.blue_5,
                ),
              ),
              AppTextBuilder(_gstin)
                  .size(_fontSize)
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
                  size: _iconSize,
                  color: AppColors.blue_5,
                ),
              ),
              AppTextBuilder(DefaultTexts.RUPEE_SYMBOL +
                      DefaultTexts.SPACE +
                      _balance.toString())
                  .size(_fontSize)
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
                  size: _iconSize,
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
