import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/constants/texts/payment_text.dart';
import 'package:jb_fe/controllers/bloc/receipt/unsorted_amount/unsorted_amount_cubit.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class ReceiptOrderLeftSection extends StatelessWidget {
  const ReceiptOrderLeftSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 70),
          child: AppTextBuilder(PaymentText.ORDERS_SECTION_HEADER)
              .size(30)
              .color(AppColors.blue_5)
              .build(),
        ),
        Column(
          children: [
            AppTextBuilder("Unsorted Amount:").color(AppColors.red_2).build(),
            Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: BlocBuilder<UnsortedAmountCubit, UnsortedAmountState>(
                  builder: (context, state) {
                    return AppTextBuilder(DefaultTexts.RUPEE_SYMBOL +
                            DefaultTexts.SPACE +
                            state.unsortedAmount.toString())
                        .build();
                  },
                ),
                decoration: BoxDecoration(
                  color: AppColors.blue_1,
                  borderRadius: const BorderRadius.all(
                    Radius.elliptical(10, 10),
                  ),
                  border: Border.all(
                    width: 3,
                    color: AppColors.blue_5,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
