import 'package:flutter/cupertino.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/constants/colors.dart';

import 'header_section.dart';
import 'item_section.dart';
import 'mid_section.dart';

class OrderDisplayContent extends StatelessWidget {
  final OrderPresentation _order;
  final PartyPresentation _party;
  const OrderDisplayContent({
    Key? key,
    required OrderPresentation order,
    required PartyPresentation party,
  })  : _order = order,
        _party = party,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(2, 2),
                  color: AppColors.grey_3, //edited
                  spreadRadius: 1,
                  blurRadius: 5 //edited
                  )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              OrderFormHeader(party: _party),
              OrderFormMidSection(order: _order),
              OrderFormItemSection(order: _order),
            ],
          ),
        ),
      ),
    );
  }
}
