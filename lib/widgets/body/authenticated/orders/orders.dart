import 'package:flutter/cupertino.dart';
import 'package:jb_fe/constants/durations/animation_durations.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/orders/card/order_card.dart';
import 'package:jb_fe/widgets/body/authenticated/orders/edit/edit_order.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  bool showEditOrderDrawer = false;

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
                      OrderCard(onOrderEdit: _onOrderEdit, orderId: "1"),
                      OrderCard(onOrderEdit: _onOrderEdit, orderId: "2"),
                      OrderCard(onOrderEdit: _onOrderEdit, orderId: "3"),
                      OrderCard(onOrderEdit: _onOrderEdit, orderId: "4"),
                      OrderCard(onOrderEdit: _onOrderEdit, orderId: "5"),
                      OrderCard(onOrderEdit: _onOrderEdit, orderId: "6"),
                      OrderCard(onOrderEdit: _onOrderEdit, orderId: "7"),
                      OrderCard(onOrderEdit: _onOrderEdit, orderId: "8"),
                      OrderCard(onOrderEdit: _onOrderEdit, orderId: "9")
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
            top: showEditOrderDrawer ? 0 : MediaQuery.of(context).size.height,
            child: EditOrder(
              toggleDrawer: _toggleDrawer,
            ),
          ),
        ],
      ),
    );
  }

  _toggleDrawer() {
    setState(() {
      showEditOrderDrawer = !showEditOrderDrawer;
    });
  }

  _onOrderEdit(String id) {
    setState(() {
      showEditOrderDrawer = !showEditOrderDrawer;
    });
    print("Edit Order: $id");
  }
}
