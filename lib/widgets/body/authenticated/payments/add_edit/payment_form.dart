import 'package:flutter/cupertino.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/widgets/body/authenticated/payments/add_edit/mid_section.dart';
import 'package:jb_fe/widgets/body/authenticated/payments/add_edit/orders_section.dart';
import 'package:jb_fe/widgets/body/authenticated/payments/add_edit/top_section.dart';

class PaymentForm extends StatelessWidget {
  const PaymentForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(20),
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
            PaymentFormTopSection(),
            PaymentFormMidSection(),
            PaymentFormOrderSection()
          ],
        ),
      ),
    );
  }
}
