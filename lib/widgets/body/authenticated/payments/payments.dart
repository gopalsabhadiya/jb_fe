import 'package:flutter/cupertino.dart';
import 'package:jb_fe/constants/durations/animation_durations.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/payments/add_edit/edit_payment.dart';
import 'package:jb_fe/widgets/body/authenticated/payments/card/payment_card.dart';

class Payments extends StatefulWidget {
  const Payments({Key? key}) : super(key: key);

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  bool showEditPaymentDrawer = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Wrap(
                    clipBehavior: Clip.hardEdge,
                    spacing: 40,
                    runSpacing: 40,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    children: [
                      PaymentCard(onPaymentEdit: _onOrderEdit, paymentId: "1"),
                      PaymentCard(onPaymentEdit: _onOrderEdit, paymentId: "2"),
                      PaymentCard(onPaymentEdit: _onOrderEdit, paymentId: "3"),
                      PaymentCard(onPaymentEdit: _onOrderEdit, paymentId: "4"),
                      PaymentCard(onPaymentEdit: _onOrderEdit, paymentId: "5"),
                      PaymentCard(onPaymentEdit: _onOrderEdit, paymentId: "6"),
                      PaymentCard(onPaymentEdit: _onOrderEdit, paymentId: "7"),
                      PaymentCard(onPaymentEdit: _onOrderEdit, paymentId: "8"),
                      PaymentCard(onPaymentEdit: _onOrderEdit, paymentId: "9"),
                    ],
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            width: ScreenSizeUtil.getBottomDrawerWidth(context),
            height: ScreenSizeUtil.getBottomDrawerHeight(context),
            curve: Curves.easeOut,
            duration: AnimationDuration.SHORT,
            top: showEditPaymentDrawer ? 0 : MediaQuery.of(context).size.height,
            child: EditPayment(
              toggleDrawer: _toggleDrawer,
            ),
          ),
        ],
      ),
    );
  }

  _toggleDrawer() {
    setState(() {
      showEditPaymentDrawer = !showEditPaymentDrawer;
    });
  }

  _onOrderEdit(String id) {
    setState(() {
      showEditPaymentDrawer = !showEditPaymentDrawer;
    });
    print("Edit Payment: $id");
  }
}
