import 'package:flutter/cupertino.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/payment_text.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

import 'order_payment.dart';

class PaymentFormOrderSection extends StatelessWidget {
  const PaymentFormOrderSection({Key? key}) : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 70),
                    child: AppTextBuilder(PaymentText.ORDERS_SECTION_HEADER)
                        .size(30)
                        .color(AppColors.blue_5)
                        .build(),
                  ),
                ],
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
                    children: [
                      PaymentFormOrderDetails(),
                      PaymentFormOrderDetails(),
                      PaymentFormOrderDetails(),
                      PaymentFormOrderDetails(),
                      PaymentFormOrderDetails(),
                      PaymentFormOrderDetails(),
                      PaymentFormOrderDetails(),
                      PaymentFormOrderDetails(),
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
}
