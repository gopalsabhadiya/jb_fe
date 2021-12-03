import 'package:flutter/cupertino.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/widgets/body/authenticated/orders/edit/header_section.dart';
import 'package:jb_fe/widgets/body/authenticated/orders/edit/item_section.dart';
import 'package:jb_fe/widgets/body/authenticated/orders/edit/mid_section.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class OrderForm extends StatelessWidget {
  const OrderForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        constraints: BoxConstraints(maxWidth: 1366),
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
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OrderFormHeader(),
            OrderFormMidSection(),
            OrderFormItemSection(),
          ],
        ),
      ),
    );
  }
}
