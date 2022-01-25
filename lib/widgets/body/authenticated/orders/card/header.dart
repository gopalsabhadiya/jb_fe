import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/backend_integration/dto/order/details/order_details_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderCardHeader extends StatelessWidget {
  final OrderDetailsPresentation _order;
  const OrderCardHeader({Key? key, required OrderDetailsPresentation order})
      : _order = order,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.account_circle,
                    size: 35, color: AppColors.blue_5),
              ),
              AppTextBuilder(_order.party.name)
                  .weight(AppFontWeight.BOLD)
                  .color(AppColors.blue_5)
                  .build(),
            ],
          ),
          IconButton(
              onPressed: () =>
                  launch("http://localhost:8080/api/bill/${_order.id}"),
              icon: const Icon(
                Icons.print,
                size: 30,
                color: AppColors.blue_5,
              ))
        ],
      ),
    );
  }
}
