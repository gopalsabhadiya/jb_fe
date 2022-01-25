import 'package:flutter/cupertino.dart';

import 'add_order_button.dart';
import 'order_search_bar.dart';

class NavbarOrderContent extends StatelessWidget {
  const NavbarOrderContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        OrderSearchBar(),
        // const FilterOrderButton(),
        // AddOrderButton()
      ],
    );
  }
}
