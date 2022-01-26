import 'package:flutter/cupertino.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/payments/payments.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/hamburger_top.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/regular_top.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScreenSizeUtil.getIsHamburgerNavbar(context)
            ? const HamburgerTopAuthenticatedNavbar()
            : const RegularTopAuthenticatedNavbar(),
        const Payments(),
      ],
    );
  }
}
