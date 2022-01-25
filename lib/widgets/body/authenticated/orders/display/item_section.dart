import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/order_text.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/inputs/search_bar.dart';

import 'order_item.dart';

class OrderFormItemSection extends StatelessWidget {
  final OrderPresentation _order;
  const OrderFormItemSection({Key? key, required OrderPresentation order})
      : _order = order,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
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
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
                child: Column(
                  children: [
                    AppTextBuilder(OrderText.ITEMS_SECTION_HEADER)
                        .size(30)
                        .color(AppColors.blue_5)
                        .build(),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 200,
                      child: AppSearchBarInput(
                          hint: OrderText.SEARCH_ITEM_INPUT,
                          onChanged: _onChange,
                          suffixIconClickHandler: _onButtonClick),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: AppColors.blue_1,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(5), bottom: Radius.circular(5)),
                  ),
                  child: ListView(
                    children: const [
                      // AppTextBuilder("hello").build()
                      // OrderFormItemSection(),
                      OrderFormItemDetails(),
                      OrderFormItemDetails(),
                      OrderFormItemDetails(),
                      OrderFormItemDetails(),
                      OrderFormItemDetails(),
                      OrderFormItemDetails(),
                      OrderFormItemDetails(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onButtonClick() {
    print("Button clicked");
  }

  void _onChange(String value) {
    print("On Changed called");
  }
}
