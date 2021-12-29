import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class PartyCardHeader extends StatelessWidget {
  final String _name;
  final int _partyId;
  const PartyCardHeader({Key? key, required name, required partyId})
      : _name = name,
        _partyId = partyId,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          minWidth: 250, minHeight: 50, maxWidth: 250, maxHeight: 50),
      decoration: const BoxDecoration(
        color: AppColors.grey_2,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.account_circle,
                    size: 35, color: AppColors.blue_5),
              ),
              AppTextBuilder(_name).size(18).color(AppColors.blue_5).build()
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: AppTextBuilder(_partyId.toString())
                .size(18)
                .color(AppColors.grey_4)
                .build(),
          )
        ],
      ),
    );
  }
}
