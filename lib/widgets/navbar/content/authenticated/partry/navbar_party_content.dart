import 'package:flutter/cupertino.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/partry/party_search_bar.dart';

import 'add_party_button.dart';

class NavbarPartyContent extends StatelessWidget {
  const NavbarPartyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        PartySearchBar(),
        // const FilterPartyButton(),
        AddPartyButton()
      ],
    );
  }
}
