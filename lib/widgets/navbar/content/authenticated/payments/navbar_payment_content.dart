import 'package:flutter/cupertino.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/payments/payment_search_bar.dart';

import 'add_payment_button.dart';

class NavbarPaymentContent extends StatelessWidget {
  const NavbarPaymentContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        PaymentSearchBar(),
        // const FilterPartyButton(),
        AddPaymentButton()
      ],
    );
  }
}
